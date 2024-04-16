defmodule LanguageListTest do
  use ExUnit.Case

  describe "LanguageList.new/0" do
    test "return a empty list" do
      assert LanguageList.new == []
    end
  end

  describe "LanguageList.add/2" do
    test "add the 'Elixir' on the inputed list" do
      assert LanguageList.new() |> LanguageList.add("Elixir") == ["Elixir"]
    end

    test "add the 'Clojure', 'Haskell', 'Erlang'  
          'F#' and 'Elixir' on the inputed list" do

      assert LanguageList.new() |> LanguageList.add("Clojure")
                                |> LanguageList.add("Haskell")
                                |> LanguageList.add("Erlang")
                                |> LanguageList.add("F#")
                                |> LanguageList.add("Elixir") 
                                == ["Elixir", "F#", "Erlang", "Haskell", "Clojure"]
    end
  end

  describe "LanguageList.remove/0" do
    test "remove the first element of the list" do
      list = LanguageList.new() |> LanguageList.add("Elixir") 
                                |> LanguageList.remove()
      assert list == []
    end

    test "remove the first element of the list, when 2 elements" do
      list =
        LanguageList.new()
        |> LanguageList.add("F#")
        |> LanguageList.add("Elixir")
        |> LanguageList.remove()
    
      assert list == ["F#"]
    end
  end
end
