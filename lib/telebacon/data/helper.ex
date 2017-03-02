defmodule Telebacon.Data.Helper do
  @moduledoc "A couple helpers for parsing nested structures"

  @spec fromMap(struct, atom, atom) :: struct
  def fromMap(struct, key, ty) do
    struct = case Map.get(struct, key) do
      nil -> struct
      val ->
        pval = apply(ty, :fromMap, [val])
        %{struct | key => pval}
    end
    struct
  end

  @spec fromMapList(struct, atom, atom) :: struct
  def fromMapList(struct, key, ty) do
    struct = case Map.get(struct, key) do
      nil -> struct
      list -> Enum.map(list, fn val ->
        pval = apply(ty, :fromMap, [val])
        %{struct | key => pval}
      end)
    end
    struct
  end
end
