defmodule VibrantVolumes.Repo do
  use Ecto.Repo,
    otp_app: :vibrant_volumes,
    adapter: Ecto.Adapters.Postgres
end
