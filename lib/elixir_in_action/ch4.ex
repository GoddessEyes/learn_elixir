defmodule ElixirInAction.Ch4 do
  def map_set do
    MapSet.new()
    |> MapSet.put(:monday)
    |> MapSet.put(:tuesday)
  end
end
