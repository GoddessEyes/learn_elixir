defmodule LearnElixirTest.IntroducingElixir.Ch10.Drop do
  alias IntroducingElixir.Ch10.Drop
  use ExUnit.Case, async: true

  test "Zero distance gives zero velocity" do
    assert Drop.fall_velocity(:earth, 0) == 0
  end
end
