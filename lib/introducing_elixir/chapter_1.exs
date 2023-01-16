# Using erlang functions from math module:
:math.pow(3, 2)
:math.cos(:math.pi)

# Var definition
a = 1; b = 2;

# iex load file `c("path/to/file")`

# reload module after changes `r Module`
defmodule Greeter do
  def greet(a) do
    "Hello " <> a <> " !!!" |> IO.puts
  end
end
