defmodule WhatFun.Query do
  @moduledoc """
  Non-persisted schema for the query form.
  """

  use Ecto.Schema

  embedded_schema do
    field(:arg, :string)
  end
end
