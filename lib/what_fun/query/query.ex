defmodule WhatFun.Query do
  @moduledoc """
  Non-persisted schema for the query form.
  """

  use Ecto.Schema

  alias WhatFun.Arg

  embedded_schema do
    embeds_many(:arg, Arg, on_replace: :delete)
  end
end
