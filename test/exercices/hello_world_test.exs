defmodule HelloWorldTest do
  use ExUnit.Case

  describe "HelloWorld.hello/0" do
    test "says 'Hello, World!'" do
      assert HelloWorld.hello == "Hello, World!"
    end
  end
end
