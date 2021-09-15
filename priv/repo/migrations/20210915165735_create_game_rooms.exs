defmodule Elixgear.Repo.Migrations.CreateGameRooms do
  use Ecto.Migration

  def change do
    create table(:game_rooms) do
      add :region, :string

      timestamps()
    end

  end
end
