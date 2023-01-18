# Chapter 7: Pairs name/value

# Maps

defmodule IntroducingElixir.Ch7.Map do
  @spec crud_map :: :ok
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
defprotocol IntroducingElixir.Ch7.Valid do
  @spec valid?(t) :: any
  def valid?(data)
end

# Struct
defmodule IntroducingElixir.Ch7.Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

# Implementation Protocol for Struct
defimpl IntroducingElixir.Ch7.Valid, for: PIntroducingElixir.Ch7.Planemo do
  @spec valid?(%IntroducingElixir.Ch7.Planemo{}) :: boolean
  def valid?(p) do
    p.gravity >= 0 and p.diameter >= 0 and p.distance_from_sun >= 0
  end
end

defmodule IntroducingElixir.Ch7.Tower do
  defstruct location: "", height: 0, planemo: :earth, name: ""
end

# Redefine protoccol `Inspect` for struct `Tower`
defimpl Inspect, for: IntroducingElixir.Ch7.Tower do
  import Inspect.Algebra

  def inspect(item, _options) do
    metres = concat(to_string(item.height), "m:")
    concat([metres, break(), item.name, ",", break(), item.location, ",", break(), to_string(item.planemo)])
  end
end
