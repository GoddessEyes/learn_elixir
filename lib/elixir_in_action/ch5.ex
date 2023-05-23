defmodule ElixirInAction.Ch5 do
  def send_message_to_self() do
    send(self(), {:message, 1})
  end

  def receive_message do
    receive do
      {:message, id} -> IO.inspect("received message #{id}")
    after
      5000 -> IO.puts("Not received")
    end
  end
end

defmodule ElixirInAction.DatabaseServer do
  def start do
    spawn(fn ->
      connection = :rand.uniform(1000)
      loop(connection)
    end)
  end

  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  def get_result do
    receive do
      {:query_result, result} -> result
    after
      5000 -> {:error, :timeout}
    end
  end

  defp loop(connection) do
    receive do
      {:run_query, from_pid, query_def} ->
        query_result = run_query(connection, query_def)
        send(from_pid, {:query_result, query_result})
    end

    loop(connection)
  end

  defp run_query(connection, query_def) do
    Process.sleep(2000)
    "Connection #{connection}: #{query_def} result"
  end
end

# Create pool:
#  pool = Enum.map(1..100, fn _ -> DatabaseServer.start() end)

# Send task to random server from pool
# Enum.each(
#  1..5,
#  fn query_def ->
#  server_pid = Enum.at(pool, :rand.uniform(100) - 1)
#  DatabaseServer.run_async(server_pid, query_def)
#  end
#  )

# Geting results
# Enum.map(1..5, fn _ -> DatabaseServer.get_result() end)

defmodule Calculator do
  def start do
    spawn(fn -> loop(0) end)
  end

  def value(server_pid) do
    send(server_pid, {:value, self()})

    receive do
      {:response, value} ->
        value
    end
  end

  def add(server_pid, value), do: send(server_pid, {:add, value})
  def sub(server_pid, value), do: send(server_pid, {:sub, value})
  def mul(server_pid, value), do: send(server_pid, {:mul, value})
  def div(server_pid, value), do: send(server_pid, {:div, value})

  defp loop(current_value) do
    new_value =
      receive do
        {:value, caller} ->
          send(caller, {:response, current_value})
          current_value

        {:add, value} ->
          current_value + value

        {:sub, value} ->
          current_value - value

        {:mul, value} ->
          current_value * value

        {:div, value} ->
          current_value / value

        invalid_request ->
          IO.puts("invalid request #{inspect(invalid_request)}")
      end

    loop(new_value)
  end
end
