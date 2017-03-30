defmodule Telebacon.Data.Helper do
  @moduledoc "A couple helpers for parsing nested structures"

  @spec from_map(struct, atom, atom) :: struct
  def from_map(struct, key, ty) do
    struct = case Map.get(struct, key) do
      nil -> struct
      val ->
        pval = apply(ty, :from_map, [val])
        %{struct | key => pval}
    end
    struct
  end

  @spec from_map_list(struct, atom, atom) :: struct
  def from_map_list(struct, key, ty) do
    struct = case Map.get(struct, key) do
      nil -> struct
      list ->
        plist = list |> Enum.map(fn val ->
          apply(ty, :from_map, [val])
        end)
        %{struct | key => plist}
    end
    struct
  end
end
