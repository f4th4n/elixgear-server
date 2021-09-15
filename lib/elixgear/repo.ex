defmodule Elixgear.Repo do
  use Ecto.Repo,
    otp_app: :elixgear,
    adapter: Ecto.Adapters.Postgres
end
