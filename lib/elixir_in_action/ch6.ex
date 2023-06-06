## KVStore server realization:
defmodule KeyValueStore do
  @moduledoc """
    ## Examples
      iex> {:ok, pid} = KeyValueStore.start()
  		{:ok, #PID<0.574.0>}
      iex> KeyValueStore.put(pid, :some_key, :some_value)
      :ok
      iex> KeyValueStore.put(:some_key1, :some_value)
      :ok
      iex> KeyValueStore.all(pid)
      %{some_key: :some_value, some_key1: :some_value}
      iex> KeyValueStore.get(pid, :some_key)
      :some_value
  """

  use GenServer

  # Interface func:
  def start do
    GenServer.start(__MODULE__, nil, name: KeyValueStore)
  end

  def put(key, value) do
    GenServer.cast(__MODULE__, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def all(pid) do
    GenServer.call(pid, :all)
  end

  # Genserver impl:

  @impl GenServer
  def init(_) do
    {:ok, %{}}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  @impl GenServer
  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl GenServer
  def handle_call(:all, _, state) do
    {:reply, state, state}
  end
end
