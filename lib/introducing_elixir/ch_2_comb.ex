# Chapter 2: Functions and modules

defmodule IntroducingElixir.Chapter2.Combined do
  import IntroducingElixir.Ch2Drop.Drop
  import IntroducingElixir.Ch2Drop.Convert
  import :math, only: [sqrt: 1]

  @spec height_to_mph(number) :: float
  def height_to_mph(meters), do: meters |> fall_velocity |> mps_to_mph

  def use_sqrt, do: sqrt(9)
end
