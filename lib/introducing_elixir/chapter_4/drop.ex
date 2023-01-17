# Chapter 4 logic & recursion

defmodule IntroducingElixir.Chapter4.Drop do
  @spec fall_velocity(:earth | :mars | :moon, number) ::
          :fast | :moving | :slow | :speedy | :stable
  def fall_velocity(planemo, distance) when distance > 0 do
    gravity = case planemo do
      :earth -> 9.8
      :moon -> 1.6
      :mars -> 3.71
    end
    velocity = :math.sqrt(2 * gravity * distance)

    result = cond do
      velocity == 0 -> :stable
      velocity < 5 -> :slow
      velocity >= 5 and velocity < 10 -> :moving
      velocity >= 10 and velocity < 20 -> :fast
      velocity >= 20 -> :speedy
    end

    if result == :speedy, do: IO.puts "Woow"
    unless result == :speedy, do: IO.puts "Bruh"

    result
  end

end


defmodule IntroducingElixir.Chapter4.Count do
  @doc """
  Recur function with side-effect
  """
  @spec countdown(number) :: :ok
  def countdown(number) when number > 0 do
    IO.puts number
    countdown(number - 1)
  end

  def countdown(_) do
    IO.puts "Blastoff!!!"
  end

  # Recur func with cumulative
  @spec countup(number) :: :ok
  def countup(limit), do: countup(1, limit)

  defp countup(count, limit) when count <= limit  do
    IO.inspect(count)
    countup(count+1, limit)
  end

  defp countup(_count, _limit) do
    IO.puts("Finish!")
  end
end


defmodule IntroducingElixir.Chapter4.Factorial do
  @spec fact!(number) :: number
  def fact!(number) when number > 1 do
    IO.puts "Calling from #{number}"
    result = number * fact!(number - 1)
    IO.puts "#{number} yields #{result}"
    result
  end
  def fact!(number) when number <= 1 do
    IO.puts "Calling from 1"
    IO.puts "1 yields 1"
    1
  end
  def test do
    3 + 1
  end
end

IntroducingElixir.Chapter4.Factorial.fact!(3)
IntroducingElixir.Chapter4.Factorial.test
