defmodule ElixgearWeb.GameRoomView do
  use ElixgearWeb, :view
  alias ElixgearWeb.GameRoomView

  def render("index.json", %{game_rooms: game_rooms}) do
    %{data: render_many(game_rooms, GameRoomView, "game_room.json")}
  end

  def render("show.json", %{game_room: game_room}) do
    %{data: render_one(game_room, GameRoomView, "game_room.json")}
  end

  def render("game_room.json", %{game_room: game_room}) do
    %{id: game_room.id,
      region: game_room.region}
  end
end
