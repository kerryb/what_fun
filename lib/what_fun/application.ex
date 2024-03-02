defmodule WhatFun.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WhatFunWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:what_fun, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WhatFun.PubSub},
      # Start a worker by calling: WhatFun.Worker.start_link(arg)
      # {WhatFun.Worker, arg},
      # Start to serve requests, typically the last entry
      WhatFunWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WhatFun.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WhatFunWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
