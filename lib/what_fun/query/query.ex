defmodule WhatFun.Query do
  @moduledoc """
  Non-persisted schema for the query form.
  """

  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field(:name, :string)

    embeds_many :args, Arg, on_replace: :delete do
      field(:type, :string)
    end
  end

  def changeset(query, attrs) do
    IO.inspect(attrs, label: :attrs)

    query
    |> cast(attrs, [:name])
    |> cast_embed(:args,
      with: &arg_changeset/2,
      sort_param: :args_sort,
      drop_param: :args_drop
    )
    |> dbg()
  end

  def arg_changeset(arg, attrs) do
    IO.inspect(attrs, label: :arg_attrs)

    arg
    |> cast(attrs, [:type])
    |> dbg()
  end
end
