# Chapter 9. Process

pid = self()

send(pid, :test)

# flush() for iex
send(pid, :test)

receive do
  value -> value
end


defmodule Bounce do
  def report do
    receive do
      val ->
        IO.puts("Received #{val} message")
        report()
    end
  end
end

# For iex test:
# pid = spawn(Bounce, :report, [])
# send(pid, :test)

Process.register(self(), :proc_name)
send(:proc_name, :test)
