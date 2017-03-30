defmodule Telebacon.SimpleAPI do
  @moduledoc false
  alias Telebacon.HTTP, as: HTTP
  alias Telebacon.SimpleAPI, as: Simple

  defmacro call(name, in_ty, out_ty) do
    {fun_name, api} = api_name(name)
    make_fun(fun_name, in_ty, api, out_ty)
  end

  def handle_result(:ok, response, parsefn) do
    with  results = Map.get(response, "result"),
          false <- is_nil(results),
          parsed <- parsefn.(results) do
      {:ok, parsed}
    else
      _ -> {:error, response}
    end
  end
  def handle_result(_, response, _), do: {:error, response}

  defp api_name([first | rest]) do
    snake_rest = Enum.join(rest, "_")
    camel = Macro.camelize(snake_rest)
    lower = Atom.to_string(first)
    fun_name = Enum.join([first, snake_rest],"_")
    api_call = lower <> camel
    {fun_name, api_call}
  end

  defp make_fun(fun_name, nil, api, out_ty) do
    quote do
      @spec unquote(:"#{fun_name}")(tel_key)
        :: {:ok, unquote(out_ty_fun(out_ty))}
        | {:failure, any}
      def unquote(:"#{fun_name}")(key) do
        {ty, response} = HTTP.call(key, unquote(api), %{})
        Simple.handle_result(ty, response, unquote(parse_fun(out_ty)))
      end
    end
  end
  defp make_fun(fun_name, in_ty, api, out_ty) do
    quote do
      @spec unquote(:"#{fun_name}")(tel_key, unquote(in_ty).t)
        :: {:ok, unquote(out_ty_fun(out_ty))}
        | {:failure, any}
      def unquote(:"#{fun_name}")(key, data) do
        {ty, response} = HTTP.call(key, unquote(api), data)
        Simple.handle_result(ty, response, unquote(parse_fun(out_ty)))
      end
    end
  end

  defp out_ty_fun(:bool), do: quote do: boolean
  defp out_ty_fun(:integer), do: quote do: integer
  defp out_ty_fun(%{}), do: quote do: %{}
  defp out_ty_fun([ty]), do: quote do: [unquote(out_ty_fun(ty))]
  defp out_ty_fun(ty), do: quote do: unquote(ty).t
  defp parse_fun(:bool), do: quote do: fn x -> x end
  defp parse_fun(:integer), do: quote do: fn x -> x end
  defp parse_fun([ty]), do: quote do: fn list ->
    Enum.map(list,unquote(parse_fun(ty)))
  end
  defp parse_fun(ty), do: quote do: fn data ->
    unquote(ty).from_map(data)
  end

end
