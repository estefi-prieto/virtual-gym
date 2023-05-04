defmodule VirtualGym.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VirtualGymWeb.Telemetry,
      # Start the Ecto repository
      VirtualGym.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VirtualGym.PubSub},
      # Start Finch
      {Finch, name: VirtualGym.Finch},
      # Start the Endpoint (http/https)
      VirtualGymWeb.Endpoint
      # Start a worker by calling: VirtualGym.Worker.start_link(arg)
      # {VirtualGym.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VirtualGym.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VirtualGymWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
