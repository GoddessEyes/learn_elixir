defmodule Solution do
  @spec hello :: :ok
  def hello do
    IO.puts "Hello, World!"
  end

  @spec print_twice(any) :: :ok
  def print_twice (value) do
    IO.puts value
    IO.puts value
  end

  @spec concate_and_upcase(binary, binary) :: binary
  def concate_and_upcase(str1, str2) do
    str1 <> str2 |> String.upcase(:ascii) |> String.trim
  end

  @spec do_math(integer, integer) :: :ok
  def do_math(a, b) do
    (a + b) / b |> IO.puts
    div(a, b) |> IO.puts
    rem(b, a) |> IO.puts
  end

  @spec any?(any, any, any, any) :: any
  def any?(a, b, c, d) do
    a || b || c || d
  end

  @spec truthy?(any, any) :: any
  def truthy?(a, b) do
    a && b
  end

  @spec distance({:point, number, number}, {:point, number, number}) :: float
  def distance({:point, x1, y1}, {:point, x2, y2}) do
    x_dist = abs(x1 - x2)
    y_dist = abs(y1 - y2)
    :math.sqrt(:math.pow(x_dist, 2) + :math.pow(y_dist, 2))
  end

  @spec is_point_inside_circle({:point, number, number}, {:circle, {:point, number, number}, any}) ::
          boolean
  def is_point_inside_circle(point, circle) do
    {:circle, center, radius} = circle
    distance(point, center) <= radius
  end

  @spec is_point_inside_rect({:point, any, any}, {:rect, {:point, any, any}, {:point, any, any}}) ::
          boolean
  def is_point_inside_rect(point, rect) do
    {:point, x, y} = point
    {:rect, left_top, right_bottom} = rect
    {:point, left_x, top_y} = left_top
    {:point, right_x, bottom_y} = right_bottom
    x >= left_x and x <= right_x and y <= top_y and y >= bottom_y
  end

  @spec get_second_item(nonempty_maybe_improper_list) :: number
  def get_second_item(list) do
    [head_1 | tail] = list
    [head_2 | _] = tail
    head_1 + head_2
  end

  def keys_sum(map, key1, key2) do
    value_1 = Map.get(map, key1, 0)
    value_2 = Map.get(map, key2, 0)
    value_1 + value_2
  end

  def keys_product(map, key1, key2) do
    value_1 = Map.get(map, key1, 1)
    value_2 = Map.get(map, key2, 1)
    value_1 * value_2
  end

  def copy_key(from_map, to_map, key, default_value) do
    value_for_put = Map.get(from_map, key, default_value)
    Map.put(to_map, key, value_for_put)
  end

  def get_age(user) do
    {:user, _, age} = user
    age
  end

  def get_names(users) do
    [{:user, name_1, _}, {:user, name_2, _}, {:user, name_3, _}] = users
    [name_1, name_2, name_3]
  end

end
