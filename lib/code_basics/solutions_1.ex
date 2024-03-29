defmodule CodeBasics.Solution1 do
  @type cell :: :x | :o | :f
  @type row :: {cell, cell, cell}
  @type game_state :: {row, row, row}
  @type game_result :: {:win, :x} | {:win, :o} | :no_win

  @spec valid_game?(game_state) :: boolean
  def valid_game?({row1, row2, row3}) do
    valid_row(row1) and valid_row(row2) and valid_row(row3)
  end

  def valid_game?(_), do: false

  @spec valid_row(any) :: boolean
  def valid_row({cell1, cell2, cell3}) do
    valid_cell(cell1) and valid_cell(cell2) and valid_cell(cell3)
  end

  def valid_row(_), do: false

  @spec valid_cell(any) :: boolean
  def valid_cell(:x), do: true
  def valid_cell(:o), do: true
  def valid_cell(:f), do: true
  def valid_cell(_), do: false

  @spec check_who_win(game_state) :: game_result
  def check_who_win({{c, c, c}, _, _}) when c != :f, do: {:win, c}
  def check_who_win({_, {c, c, c}, _}) when c != :f, do: {:win, c}
  def check_who_win({_, _, {c, c, c}}) when c != :f, do: {:win, c}
  def check_who_win({{c, _, _}, {c, _, _}, {c, _, _}}) when c != :f, do: {:win, c}
  def check_who_win({{_, c, _}, {_, c, _}, {_, c, _}}) when c != :f, do: {:win, c}
  def check_who_win({{_, _, c}, {_, _, c}, {_, _, c}}) when c != :f, do: {:win, c}
  def check_who_win({{c, _, _}, {_, c, _}, {_, _, c}}) when c != :f, do: {:win, c}
  def check_who_win({{_, _, c}, {_, c, _}, {c, _, _}}) when c != :f, do: {:win, c}
  def check_who_win(_), do: :no_win

  def process(str, num) do
    # 15 / 22
    str
    |> String.trim_leading()
    |> String.trim_trailing()
    |> String.downcase()
    |> String.duplicate(num)
  end

  # 16/22
  def range(from, to) when from > to do
    []
  end

  def range(from, to) do
    range(from, to, [])
  end

  def range(from, to, accum) when from == to do
    Enum.reverse([to | accum])
  end

  def range(from, to, accum) do
    range(from + 1, to, [from | accum])
  end
end
