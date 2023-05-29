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

defmodule ElixirInAction.Ch4.TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)

    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do
    %TodoList{todo_list | entries: Map.delete(todo_list.entries, entry_id)}
  end
end
