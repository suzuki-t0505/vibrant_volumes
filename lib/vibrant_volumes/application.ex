defmodule VibrantVolumes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VibrantVolumesWeb.Telemetry,
      # Start the Ecto repository
      VibrantVolumes.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: VibrantVolumes.PubSub},
      # Start Finch
      {Finch, name: VibrantVolumes.Finch},
      # Start the Endpoint (http/https)
      VibrantVolumesWeb.Endpoint
      # Start a worker by calling: VibrantVolumes.Worker.start_link(arg)
      # {VibrantVolumes.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VibrantVolumes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VibrantVolumesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
