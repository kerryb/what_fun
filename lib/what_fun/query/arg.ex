defmodule WhatFun.Arg do
  @moduledoc """
  Non-persisted schema for an argument on the query form.
  """

  use Ecto.Schema

  embedded_schema do
    field :position, :string
    field :value, :string
  end
end
