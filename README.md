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

Run `iex -S mix` to try it out:
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

# Try the GenServer with debug options
{:ok,pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:trace, :statistics]])
GenServer.call(pid, :next_number)
# *DBG* <0.68.0> got call next_number from <0.25.0>
# *DBG* <0.68.0> sent 101 to <0.25.0>, new state 102
101
GenServer.cast(pid, {:increment_number, 500})

# Check some cool statistics about the server
:sys.statistics pid, :get
# You should see an output similar to this:
{:ok,
 [
   start_time: {{2020, 4, 21}, {0, 11, 23}},
   current_time: {{2020, 4, 21}, {0, 12, 30}},
   reductions: 729,
   messages_in: 8,
   messages_out: 5
 ]}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sequence](https://hexdocs.pm/sequence).

