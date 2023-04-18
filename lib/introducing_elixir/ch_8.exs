# Chapter 8: High-order func & list-comprehensions

defmodule Hof do
  @spec tripler(number, (number -> number)) :: number
  def tripler(value, function), do: 3 * function.(value)
end

Hof.tripler(1, fn value -> value * 2 end)
Hof.tripler(1, &(&1 * 2))
Hof.tripler(:math.pi(), &:math.cos(&1))

list = [1, 2, 4, 8, 16, 32]
list_2 = [2, 4, 6]

Enum.map(list, &(&1 * &1))

for value <- list, do: value * value

# Range
for value <- 1..9, do: value + value

four_bits_num = &(&1 >= 0 and &1 < 16)
Enum.filter(list, four_bits_num)

for value <- list, value >= 0, value < 16, do: value

List.foldl(list, 0, &(&2 + &1 * &1))
