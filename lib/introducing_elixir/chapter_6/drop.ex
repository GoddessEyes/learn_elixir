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


defmodule Pascal do
  def triangle(rows), do: triangle([[0, 1, 0]], 1, rows)

  def triangle(list, count, rows) when count >= rows do
    Enum.reverse list
  end

  def triangle(list, count, rows) do
    [prev | _] = list
    triangle([add_row(prev) | list], count + 1, rows)
  end

  def add_row(init), do: add_row(init, 0, [])

  def add_row([], 0, final), do: [0 | final]

  def add_row([h | t], last, new), do: add_row(t, h, [last + h | new])
end
