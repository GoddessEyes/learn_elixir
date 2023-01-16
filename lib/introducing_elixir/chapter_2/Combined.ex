defmodule IntroducingElixir.Chapter2.Combined do
  import IntroducingElixir.Chapter2.Drop
  import IntroducingElixir.Chapter2.Convert
  import :math, only: [sqrt: 1]

  @spec height_to_mph(number) :: float
  def height_to_mph(meters), do: meters |> fall_velocity |> mps_to_mph

  def use_sqrt, do: sqrt 9
end
