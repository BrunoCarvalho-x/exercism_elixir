defmodule GuessingGameTest do
  use ExUnit.Case

  describe "GuessingGame.compare/2" do
    test "when inputs equals 7 and 7, return 'Correct'" do
      assert GuessingGame.compare(7, 7) == "Correct"
    end

    test "when inputs equals 9 and 18, return 'Too high'" do
      assert GuessingGame.compare(9, 18) == "Too high"
    end

    test "when inputs equals 42 and 30, return 'Too low'" do
      assert GuessingGame.compare(42, 30) == "Too low"
    end

    test "when inputs equals 64 and 63, return 'So close'" do
      assert GuessingGame.compare(64, 63) == "So close"
    end

    test "when inputs equals 52 and 53, return 'So close'" do
      assert GuessingGame.compare(52, 53) == "So close"
    end

    test "when inputs equals 15 and nil, return 'Make a guess'" do
      assert GuessingGame.compare(15) == "Make a guess"
    end

    test "when input equals 16 and no a number, return 'Make a guess'" do
      assert GuessingGame.compare(16, :no_guess) == "Make a guess"
    end
  end
end
