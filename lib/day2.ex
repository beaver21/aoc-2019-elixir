defmodule Day2 do

  def main() do
    input()
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> run
  end

  def main2() do
    expected_value = 19690720
    pairs = Enum.flat_map(0..99, fn n -> Enum.map(0..99, fn m -> [n, m] end) end)

    [noun, verb] = Enum.find(pairs, fn [noun, verb] ->
      expected_value == input()
      |> List.replace_at(1, noun)
      |> List.replace_at(2, verb)
      |> run
    end)

    noun * 100 + verb
  end

  def run(program, pointer \\ 0) do
    case step(program, pointer) do
      {:halt, value} -> value
      {:step, program, next_pointer} -> run(program, next_pointer)
    end
  end

  def step(program, pointer) do
    op = Enum.at(program, pointer)

    case op do
      1 -> add_op(program, pointer)
      2 -> mult_op(program, pointer)
      99 -> halt(program)
    end
  end

  def halt(program) do
    {:halt, Enum.at(program, 0)}
  end

  def add_op(program, pointer) do
    {:step, run_op(program, pointer, & &1 + &2), pointer + 4}
  end

  def mult_op(program, pointer) do
    {:step, run_op(program, pointer, & &1 * &2), pointer + 4}
  end

  defp run_op(program, pointer, f) do
    [_, input1_pos, input2_pos, output_pos | _] = Enum.drop(program, pointer)
    input1 = Enum.at(program, input1_pos)
    input2 = Enum.at(program, input2_pos)

    List.replace_at(program, output_pos, f.(input1, input2))
  end

  defp input() do
    [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,5,19,23,2,6,23,27,1,27,5,31,2,9,31,35,1,5,35,39,2,6,39,43,2,6,43,47,1,5,47,51,2,9,51,55,1,5,55,59,1,10,59,63,1,63,6,67,1,9,67,71,1,71,6,75,1,75,13,79,2,79,13,83,2,9,83,87,1,87,5,91,1,9,91,95,2,10,95,99,1,5,99,103,1,103,9,107,1,13,107,111,2,111,10,115,1,115,5,119,2,13,119,123,1,9,123,127,1,5,127,131,2,131,6,135,1,135,5,139,1,139,6,143,1,143,6,147,1,2,147,151,1,151,5,0,99,2,14,0,0]
  end
end
