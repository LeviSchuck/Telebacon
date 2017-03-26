defmodule Telebacon.Data.Inspect do
  @moduledoc """
  Replacement inspection for telegram data, hides all the nil values.
  """

  defmacro __using__(_) do
    quote do
      defimpl Inspect, for: __MODULE__ do
        import Inspect.Algebra
        def inspect(struct, opts) do
          all_vals = Map.to_list(Map.from_struct(struct))
          vals = all_vals
            |> Enum.filter(fn {_, v} -> not is_nil(v) end)
          concat ["#", List.last(Module.split(__MODULE__)), to_doc(vals, opts)]
        end
      end
    end
  end
end
