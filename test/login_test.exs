defmodule LoginTest do
  use ExUnit.Case
  doctest Login

  test "greets the world" do
    assert Login.hello() == :world
  end
end
