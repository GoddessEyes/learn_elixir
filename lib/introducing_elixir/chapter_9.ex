# Chapter 9. Process

# For iex test:

# pid = self()

# send(pid, :test)

# # flush() for iex
# send(pid, :test)

# receive do
#   value -> value
# end


# defmodule Bounce do
#   def report do
#     receive do
#       val ->
#         IO.puts("Received #{val} message")
#         report()
#     end
#   end
# end

# pid = spawn(Bounce, :report, [])
# send(pid, :test)

# Process.register(self(), :proc_name)
# send(:proc_name, :test)


defmodule IntroducingElixir.Chapter9.Drop do
  def drop do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity({planemo, distance})})
        drop()
    end

  end

  defp fall_velocity({:earth, distance}) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity({:moon, distance}) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity({:mars, distance}) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end
