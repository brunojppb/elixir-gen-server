defmodule Sequence.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Sequence.Worker.start_link(arg)
      { Stack.Server, ["bruno", 99] },
      { Sequence.Stash, 123 },
      { Sequence.Server, nil },
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    # :rest_for_one
    #   - The subsequent servers on the children list depend on the health of the previous server.
    #     If the server terminates, all the following children should be terminated and restarted
    opts = [strategy: :rest_for_one, name: Sequence.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
