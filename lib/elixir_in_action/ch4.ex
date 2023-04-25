# defmodule ElixirInAction.Ch4 do
#   def map_set do
#     MapSet.new()
#     |> MapSet.put(:monday)
#     |> MapSet.put(:tuesday)
#   end
# end

# defmodule ElixirInAction.Ch4.TodoList do
#   @spec new :: %{}
#   def new(), do: %{}

#   def add_entry(todo_list, entry) do
#     Map.update(todo_list, entry.date, entry)
#   end

#   def entries(todo_list, date) do
#     Map.get(todo_list, date, [])
#   end
# end

defmodule ElixirInAction.Ch4.Fraction do
  alias ElixirInAction.Ch4.Fraction
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def value(%Fraction{a: a, b: b}) do
    a / b
  end

  def add(%Fraction{a: a1, b: b1}, %Fraction{a: a2, b: b2}) do
    new(
      a1 * b2 + a2 * b1,
      b2 * b1
    )
  end

  def test do
    add(%Fraction{a: 1, b: 2}, %Fraction{a: 1, b: 4})
    |> value()
  end
end
