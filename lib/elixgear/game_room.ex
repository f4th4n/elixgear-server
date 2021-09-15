defmodule Elixgear.GameRoom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_rooms" do
    field :region, :string

    timestamps()
  end

  @doc false
  def changeset(game_room, attrs) do
    game_room
    |> cast(attrs, [:region])
    |> validate_required([:region])
  end
end
