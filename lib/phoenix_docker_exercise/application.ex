defmodule PhoenixDockerExercise.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixDockerExerciseWeb.Telemetry,
      # Start the Ecto repository
      PhoenixDockerExercise.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixDockerExercise.PubSub},
      # Start Finch
      {Finch, name: PhoenixDockerExercise.Finch},
      # Start the Endpoint (http/https)
      PhoenixDockerExerciseWeb.Endpoint
      # Start a worker by calling: PhoenixDockerExercise.Worker.start_link(arg)
      # {PhoenixDockerExercise.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixDockerExercise.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixDockerExerciseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
