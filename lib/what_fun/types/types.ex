defmodule WhatFun.Types do
  @moduledoc """
  Builds a compile-time list of types in all known modules (excluding this
  application itself).
  """

  alias WhatFun.Types.Lister

  @all Lister.all()
  def all, do: @all
end
