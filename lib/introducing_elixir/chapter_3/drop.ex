# Chapter 3 atoms, tuples & pattern matching

defmodule IntroducingElixir.Chapter3.Drop do
  @spec fall_velocity({atom, number}) :: :ok | float
  def fall_velocity({:earth, distance}) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  def fall_velocity({:moon, distance}) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  def fall_velocity({:mars, distance}) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end

  def fall_velocity({_, distance}) when distance < 0 do
    :logger.log :warning, "Negative distance?"
  end

end
