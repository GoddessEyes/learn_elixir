defmodule Solution do
  def hello do
    IO.puts "Hello, World!"
  end

  def print_twice (value) do
    IO.puts value
    IO.puts value
  end

  def concate_and_upcase(str1, str2) do
    str1 <> str2 |> String.upcase(:ascii) |> String.trim
  end

  def do_math(a, b) do
    (a + b) / b |> IO.puts
    div(a, b) |> IO.puts
    rem(b, a) |> IO.puts
  end

  def any?(a, b, c, d) do
    a || b || c || d
  end

  def truthy?(a, b) do
    a && b
  end

  def distance({:point, x1, y1}, {:point, x2, y2}) do
    x_dist = abs(x1 - x2)
    y_dist = abs(y1 - y2)
    :math.sqrt(:math.pow(x_dist, 2) + :math.pow(y_dist, 2))
  end

  def is_point_inside_circle({:point, x, y}, {:circle, {:point, x_c, y_c}, radius}) do
    # TODO реализация
  end

  def is_point_inside_rect(point, rect) do
    # TODO реализация
  end

end


defmodule Test do
  use ExUnit.Case
  import Solution

  def test_bigger_distance do
    assert 12.806248474865697 == distance({:point, 2, 2}, {:point, 10, 12})
    assert 21.213203435596427 == distance({:point, -5, -5}, {:point, 10, 10})
    assert 21.400934559032695 == distance({:point, -5, 5}, {:point, 8, -12})
    assert 17.26267650163207 == distance({:point, -5, 5}, {:point, -8, -12})
  end

  def test_point_inside_circle do
    point = {:point, 50, 50}
    assert is_point_inside_circle(point, {:circle, {:point, 10, 10}, 100})
    assert not is_point_inside_circle(point, {:circle, {:point, -10, -10}, 20})
  end

end
