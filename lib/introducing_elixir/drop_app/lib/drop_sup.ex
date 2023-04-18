defmodule DropSup do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  def init([]) do
    child = [worker(DropServer, [], [])]
    supervise(child, [{:strategy, :one_for_one}, {:max_restarts, 1}, {:max_seconds, 5}])
  end
end
