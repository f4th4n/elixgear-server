defmodule Elixgear.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :nick, :text
      add :is_playing, :boolean, default: false, null: false
      add :game_room_id, references(:game_rooms, on_delete: :nothing)

      timestamps()
    end

    create index(:players, [:game_room_id])
  end
end
