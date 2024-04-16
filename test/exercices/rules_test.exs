defmodule RulesTest do
  use ExUnit.Case

  describe "Rules.eat_ghost?/2" do
    test "Assert when inputs are true and true" do
      assert Rules.eat_ghost?(true, true)
    end

    test "Refute when inputs are false and true" do
      refute Rules.eat_ghost?(false, true)
    end

    test "Refute when inputs are true and false" do
      refute Rules.eat_ghost?(true, false)
    end

    test "Refute when inputs are false and false" do
      refute Rules.eat_ghost?(false, false)
    end
  end

  describe "Rules.score?/2" do
    test "Assert when inputs are true and true" do
      assert Rules.score?(true, true)
    end

    test "Refute when inputs are false and true" do
      assert Rules.score?(false, true)
    end

    test "Refute when inputs are true and false" do
      assert Rules.score?(true, false)
    end

    test "Refute when inputs are false and false" do
      refute Rules.score?(false, false)
    end
  end

  describe "Rules.lose?/2" do
    test "Assert when inputs are true and true" do
      refute Rules.lose?(true, true)
    end

    test "Refute when inputs are false and true" do
      assert Rules.lose?(false, true)
    end

    test "Refute when inputs are true and false" do
      refute Rules.lose?(true, false)
    end

    test "Refute when inputs are false and false" do
      refute Rules.lose?(false, false)
    end
  end

  describe "Rules.win?/3" do
    test "Assert when inputs are true, false and false" do
      assert Rules.win?(true, false, false)
    end

    test "Refute when inputs are true, false and true" do
      refute Rules.win?(true, false, true)
    end

    test "Refute when inputs are true, true, true" do
      assert Rules.win?(true, true, true)
    end

    test "when inputs are n, m, p" do
      n = :rand.uniform(2) |> rem(2) |> Kernel.==(0)
      m = :rand.uniform(2) |> rem(2) |> Kernel.==(0)
      p = :rand.uniform(2) |> rem(2) |> Kernel.==(0)

      if n == false do
        refute Rules.win?(n, m, p)
      else
        if m == false && p == true do
          refute Rules.win?(n, m, p)
        else
          assert Rules.win?(n, m, p)
        end
      end
    end
  end
end