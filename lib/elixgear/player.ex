defmodule Elixgear.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :is_playing, :boolean, default: false
    field :nick, :string
    field :game_room_id, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:nick, :is_playing])
    |> validate_required([:nick, :is_playing])
  end
end
