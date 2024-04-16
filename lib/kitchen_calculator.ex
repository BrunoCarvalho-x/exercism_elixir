defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {:milliliter, get_volume(volume_pair)*elem(Table.info(elem(volume_pair, 0)), 2)}
  end

  def from_milliliter(volume_pair, unit) do
    {unit, get_volume(volume_pair)/elem(Table.info(unit), 2)}
  end

  def convert(volume_pair, unit) do
    {unit, elem(to_milliliter(volume_pair), 1)/elem(Table.info(unit), 2)}
  end
end

defmodule Table do
  def info(:cup),         do: {:cup, 1, 240}
  def info(:teaspoon),    do: {:teaspoon, 1, 5}
  def info(:milliliter),  do: {:milliliter, 1, 1}
  def info(:tablespoon),  do: {:tablespoon, 1, 15}
  def info(:fluid_ounce), do: {:fluid_ounce, 1, 30}
end