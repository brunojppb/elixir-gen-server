defmodule Stack.Server do
  use GenServer

  def start_link(initial_stack \\ []) do
    GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)
  end

  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def init(initial_stack \\ []) do
    { :ok, initial_stack }
  end

  def handle_call(:pop , _from, current_stack) when current_stack != [] do
    [head | tail] = current_stack
    # returns:
    # - reply message to signal the GenServer about the type of the return
    # - value to be sent to the caller
    # - the next state
    { :reply, {:pop, head}, tail }
  end

  def handle_call(:pop, _from, []) do
    {:reply, :empty, []}
  end

  def handle_cast({:push, value}, current_stack) do
    # cast calls there don't return anything to the caller
    # just signal the GenServer and return he new state
    { :noreply, [value | current_stack] }
  end
end