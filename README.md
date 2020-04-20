# OTP GenServer 

Learning OTP by doing.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sequence` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sequence, "~> 0.1.0"}
  ]
end
```

Run `iex` to try it out:
```elixir
{:ok, pid} = GenServer.start_link(Sequence.Server, 100)
# {:ok, #PID<0.151.0>}
iex(2)> GenServer.call(pid, :next_number)                      
100
iex(3)> GenServer.call(pid, :next_number)
101
iex(6)> GenServer.call(pid, {:set_number, 455})
455
iex(7)> GenServer.call(pid, :next_number)      
455
iex(8)> GenServer.call(pid, :next_number)
456

```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sequence](https://hexdocs.pm/sequence).

