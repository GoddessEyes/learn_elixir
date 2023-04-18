defmodule DropApp do
  use Application

  @spec start(any, any) :: any
  def start(_type, _args) do
    # show that app si really starting.
    IO.puts("Starting the app...")
    DropSup.start_link()
  end
end
