# Chapter 2: Functions and modules

# Anonimous function definition
fall_velocity = fn(distance) -> :math.sqrt(2 * 9.8 * distance) end
fall_velocity.(20) # -> 19.79...

# Use `&` operator
fall_velocity_2 = &(:math.sqrt(2 * 9.8 * &1))

# Using module

defmodule IntroducingElixir.Ch2Drop.Drop do
  @doc """
  This documentation text
  """
  @spec fall_velocity(number, number) :: float
  def fall_velocity(distance, gravity \\ 9.8) do
    :math.sqrt 2 * gravity * distance
  end
end


defmodule IntroducingElixir.Ch2Drop.Convert do
  @spec mps_to_mph(number) :: float
  def mps_to_mph(mps), do: 2.23693629 * mps
  @spec mps_to_kph(number) :: float
  def mps_to_kph(mps), do: 3.6 * mps * 1
end
