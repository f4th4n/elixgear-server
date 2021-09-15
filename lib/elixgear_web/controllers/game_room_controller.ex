defmodule ElixgearWeb.GameRoomController do
  use ElixgearWeb, :controller

  alias Elixgear.Game
  alias Elixgear.Game.GameRoom

  action_fallback ElixgearWeb.FallbackController

  def index(conn, _params) do
    game_rooms = Game.list_game_rooms()
    render(conn, "index.json", game_rooms: game_rooms)
  end

  def create(conn, %{"game_room" => game_room_params}) do
    with {:ok, %GameRoom{} = game_room} <- Game.create_game_room(game_room_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.game_room_path(conn, :show, game_room))
      |> render("show.json", game_room: game_room)
    end
  end

  def show(conn, %{"id" => id}) do
    game_room = Game.get_game_room!(id)
    render(conn, "show.json", game_room: game_room)
  end

  def update(conn, %{"id" => id, "game_room" => game_room_params}) do
    game_room = Game.get_game_room!(id)

    with {:ok, %GameRoom{} = game_room} <- Game.update_game_room(game_room, game_room_params) do
      render(conn, "show.json", game_room: game_room)
    end
  end

  def delete(conn, %{"id" => id}) do
    game_room = Game.get_game_room!(id)

    with {:ok, %GameRoom{}} <- Game.delete_game_room(game_room) do
      send_resp(conn, :no_content, "")
    end
  end
end
