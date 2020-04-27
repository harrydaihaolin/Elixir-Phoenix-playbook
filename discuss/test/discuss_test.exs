defmodule DiscussTest do
  use ExUnit.Case
  doctest Discuss

  test "greets the world" do
    assert Discuss.hello() == :world
  end
end
