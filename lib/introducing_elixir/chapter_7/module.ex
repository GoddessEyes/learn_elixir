# Pairs name/value

# Maps

defmodule IntroducingElixir7.Map do
  def crud_map do
    planemo = %{earth: 9.8, moon: 1.6, mars: 3.71}
    %{earth: earth_gravity} = planemo
    IO.inspect planemo
    IO.puts earth_gravity
    IO.puts planemo[:moon]
    IO.puts planemo.mars
  end

end

# Protocol
defprotocol Valid do
  def valid?(data)
end

# Struct
defmodule Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

# Implementation Protocol for Struct
defimpl Valid, for: Planemo do
  @spec valid?(%Planemo{}) :: boolean
  def valid?(p) do
    p.gravity >= 0 and p.diameter >= 0 and p.distance_from_sun >= 0
  end
end

defmodule Tower do
  defstruct location: "", height: 0, planemo: :earth, name: ""
end

# Redefine protoccol `Inspect` for struct `Tower`
defimpl Inspect, for: Tower do
  import Inspect.Algebra

  def inspect(item, _options) do
    metres = concat(to_string(item.height), "m:")
    concat([metres, break(), item.name, ",", break(), item.location, ",", break(), to_string(item.planemo)])
  end
end
