defmodule Day1Test do
  use ExUnit.Case

  test "Examples" do
    assert Day1.calculate_fuel(12) == 2
    assert Day1.calculate_fuel(14) == 2
    assert Day1.calculate_fuel(1969) == 654
    assert Day1.calculate_fuel(100756) == 33583
  end

  test "Total fuel examples" do
    assert Day1.calculate_total_fuel(1969) == 966
    assert Day1.calculate_total_fuel(100756) == 50346
  end
end
