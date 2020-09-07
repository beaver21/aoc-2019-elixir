defmodule Day2Test do
  use ExUnit.Case

  test "Add operator" do
    assert Day2.run([1, 0, 0, 0, 99]) == 2
    assert Day2.run([1, 5, 6, 0, 99, 43, 54]) == 97
  end

  test "Mult operator" do
    assert Day2.run([2,5,6,0,99,20,30]) == 600
  end

  test "Halts after running multiple ops" do
    assert Day2.run([1,9,10,3,2,3,11,0,99,30,40,50]) == 3500
  end
end
