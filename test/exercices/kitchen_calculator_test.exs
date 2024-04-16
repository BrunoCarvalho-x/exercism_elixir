defmodule KitchenCalculatorTest do
  use ExUnit.Case

  describe "KitchenCalculator.get_volume/1" do
    test "Tests from Exercism" do
      assert KitchenCalculator.get_volume({:cup, 1}) == 1
      assert KitchenCalculator.get_volume({:fluid_ounce, 2}) == 2
      assert KitchenCalculator.get_volume({:teaspoon, 3}) == 3
      assert KitchenCalculator.get_volume({:tablespoon, 4}) == 4
      assert KitchenCalculator.get_volume({:milliliter, 5}) == 5
    end
  end

  describe "KitchenCalculator.to_milliliter/1" do
    test "Tests from Exercism" do
      assert KitchenCalculator.to_milliliter({:milliliter, 3}) == {:milliliter, 3}
      assert KitchenCalculator.to_milliliter({:cup, 3}) == {:milliliter, 720}
      assert KitchenCalculator.to_milliliter({:fluid_ounce, 100}) == {:milliliter, 3000}
      assert KitchenCalculator.to_milliliter({:teaspoon, 3}) == {:milliliter, 15}
      assert KitchenCalculator.to_milliliter({:tablespoon, 3}) == {:milliliter, 45}
    end
  end

  describe "KitchenCalculator.from_milliliter/2" do
    test "Tests from Exercism" do
      assert KitchenCalculator.from_milliliter({:milliliter, 4}, :milliliter) == {:milliliter, 4}
      assert KitchenCalculator.from_milliliter({:milliliter, 840}, :cup) == {:cup, 3.5}
      assert KitchenCalculator.from_milliliter({:milliliter, 4522.5}, :fluid_ounce) == {:fluid_ounce, 150.75}
      assert KitchenCalculator.from_milliliter({:milliliter, 61.25}, :teaspoon) == {:teaspoon, 12.25}
      assert KitchenCalculator.from_milliliter({:milliliter, 71.25}, :tablespoon) == {:tablespoon, 4.75}
    end
  end

  describe "KitchenCalculator.convert/2" do
    test "Tests from Exercism" do
      assert KitchenCalculator.convert({:teaspoon, 15}, :tablespoon) == {:tablespoon, 5}
      assert KitchenCalculator.convert({:cup, 4}, :fluid_ounce) == {:fluid_ounce, 32}
      assert KitchenCalculator.convert({:fluid_ounce, 4}, :teaspoon) == {:teaspoon, 24}
      assert KitchenCalculator.convert({:tablespoon, 320}, :cup) == {:cup, 20}
    end
  end
end
