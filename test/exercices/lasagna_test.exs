require IEx

defmodule LasagnaTest do
  use ExUnit.Case

  describe "Lasagna.expected_minutes_in_oven/0" do
    test "return 40" do
      assert Lasagna.expected_minutes_in_oven() == 40
    end
  end

  describe "Lasagna.remaining_minutes_in_oven/1" do
    test "when input equal 25, return 15" do
      assert Lasagna.remaining_minutes_in_oven(25) === 15
    end

    test "when input equal 30, return 10" do
      assert Lasagna.remaining_minutes_in_oven(30) === 10
    end

    test "when input equal n, return 40 - n" do
      n = :rand.uniform(40)
      assert Lasagna.remaining_minutes_in_oven(n) === 40 - n
    end
  end

  describe "Lasagna.preparation_time_in_minutes/1" do
    test "when input equal 1, return 2" do
      assert Lasagna.preparation_time_in_minutes(1) === 2
    end

    test "when input equal 4, return 8" do
      assert Lasagna.preparation_time_in_minutes(4) === 8
    end

    test "when input equal n, return 2*n" do
      n = :rand.uniform(1000)
      assert Lasagna.preparation_time_in_minutes(n) === 2*n
    end
  end
end
