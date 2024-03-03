# test/what_fun/types/types_test.exs
defmodule WhatFun.TypesTest do
  use ExUnit.Case, async: true

  alias WhatFun.Types

  describe "WhatFun.Types" do
    test "includes types from the standard library" do
      assert "String.t" in Types.all()
    end
  end
end
