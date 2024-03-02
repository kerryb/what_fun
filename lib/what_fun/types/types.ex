defmodule WhatFun.Types do
  @moduledoc """
  Builds a compile-time list of types in all known modules (excluding this
  application itself).
  """

  def all do
    for module <-
          Enum.flat_map(:code.all_loaded(), fn {mod, _} -> if to_string(mod) =~ ~r/^[A-Z]/, do: [mod], else: [] end),
        type <- types_for(module) do
      %{module: module, type: type}
    end
  end

  defp types_for(module) do
    case Code.Typespec.fetch_types(module) do
      {:ok, types} ->
        Enum.flat_map(types, fn
          {:type, {type, _, _}} -> [type]
          _ -> []
        end)

      _ ->
        []
    end
  end
end
