defmodule Differce do
  @spec m_test(any) :: any
  defmacro m_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end
  @spec f_test(any) :: any
  def f_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end
end

defmodule FunctionMaker do
  @spec create_multiplier(any, any) ::
          {:def,
           [
             {:column, 7}
             | {:context, FunctionMaker}
             | {:do, [...]}
             | {:end, [...]}
             | {:imports, [...]},
             ...
           ], [[{any, any}, ...] | {any, [...], [...]}, ...]}
  defmacro create_multiplier(func_name, factor) do
    quote do
      def unquote(func_name)(value) do
        unquote(factor) * value
      end
    end
  end
end


defmodule Multiply do
  require FunctionMaker

  FunctionMaker.create_multiplier(:double, 2)
  FunctionMaker.create_multiplier(:triple, 3)


  @spec example :: {number, number}
  def example do
    {triple(3), double(3)}
  end
end
