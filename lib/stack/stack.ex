defmodule Stack.Server do
  use GenServer

  def init(initial_stack \\ []) do
    { :ok, initial_stack }
  end

  def handle_call(:pop , _from_pid, current_stack) when current_stack != [] do
    [head | tail] = current_stack
    { :reply, {:pop, head}, tail }
  end

  def handle_call(:pop, _from_pid, []) do
    {:reply, :empty, []}
  end
end