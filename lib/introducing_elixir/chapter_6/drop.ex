# Chapter 6 Lists


defmodule IntroducingElixir.Chapter6.Overall do
  @spec product([]) :: 0
  def product([]), do: 0

  def product(list) do
    product(list, 1)
  end

  @spec product([], number) :: number
  defp product([], accumulated_product) do
    accumulated_product
  end

  defp product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end
end

defmodule ListDrop do
  import IntroducingElixir.Chapter3.Drop, only: [fall_velocity: 1]

  @spec falls(list) :: any
  def falls(list) do
    falls(list, [])
  end

  @spec falls(list, any) :: any
  def falls([], results) do
    Enum.reverse(results)
  end

  def falls([head | tail], results) do
    falls(tail, [fall_velocity(head) | results])
  end
end

defmodule IntroducingElixir.Chapter6.Examples do

  def use_print do
    print_x_y! = fn ->
      [1, x, 3, y] = [1, 2, 3, 4]
      IO.puts x
      IO.puts y
    end
    print_x_y!.()
  end
end
