defmodule React.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      React.Repo,
      # Start the Telemetry supervisor
      ReactWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: React.PubSub},
      # Start the Endpoint (http/https)
      ReactWeb.Endpoint
      # Start a worker by calling: React.Worker.start_link(arg)
      # {React.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: React.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReactWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
