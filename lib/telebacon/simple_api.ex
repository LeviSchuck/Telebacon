defmodule Telebacon.SimpleAPI do
  @moduledoc """
  Simple API is just a macro meant for private use in Telebacon.API.
  It wraps up Telegram result handling and encoding
  """
  alias Telebacon.HTTP, as: HTTP
  defmacro call(name, out_ty) do
    {fun_name, api} = api_name(name)
    rep = quote do
      @spec unquote(:"#{fun_name}")(binary)
        :: {:ok, unquote(out_ty_fun(out_ty))}
        | {:failure, any}
      def unquote(:"#{fun_name}")(key) do
        {ty, response} = HTTP.call(key, unquote(api), nil)
        handleResult(ty, response, unquote(parse_fun(out_ty)))
      end
    end
    rep
  end
  @lint false
  defmacro call(name, in_ty, out_ty) do
    {fun_name, api} = api_name(name)
    rep = quote do
      @spec unquote(:"#{fun_name}")(binary, %unquote(in_ty){})
        :: {:ok, unquote(out_ty_fun(out_ty))}
        | {:failure, any}
      def unquote(:"#{fun_name}")(key, data) do
        {ty, response} = HTTP.call(key, unquote(api), data)
        handleResult(ty, response, unquote(parse_fun(out_ty)))
      end
    end
    rep
  end

  defp api_name([first | rest]) do
    snake_rest = Enum.join(rest, "_")
    camel = Macro.camelize(snake_rest)
    lower = Atom.to_string(first)
    fun_name = Enum.join([first, snake_rest],"_")
    api_call = lower <> camel
    {fun_name, api_call}
  end

  defp out_ty_fun(:bool) do
    quote do
      boolean
    end
  end
  defp out_ty_fun(:integer) do
    quote do
      integer
    end
  end
  defp out_ty_fun(%{}) do
    quote do
      %{}
    end
  end
  defp out_ty_fun([ty]) do
    quote do
      [unquote(out_ty_fun(ty))]
    end
  end
  defp out_ty_fun(ty) do
    quote do
      %unquote(ty){}
    end
  end

  defp parse_fun(:bool) do
    quote do
      fn x -> x end
    end
  end
  defp parse_fun(:integer) do
    quote do
      fn x -> x end
    end
  end
  defp parse_fun([ty]) do
    quote do
      fn list ->
        Enum.map(list,unquote(parse_fun(ty)))
      end
    end
  end
  defp parse_fun(ty) do
    quote do
      fn data ->
        unquote(ty).fromMap(data)
      end
    end
  end
end
