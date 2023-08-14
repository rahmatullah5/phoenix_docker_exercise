defmodule PhoenixDockerExercise.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_docker_exercise,
    adapter: Ecto.Adapters.Postgres
end
