defmodule ElixgearWeb.GameRoomControllerTest do
  use ElixgearWeb.ConnCase

  alias Elixgear.Game
  alias Elixgear.Game.GameRoom

  @create_attrs %{
    region: "some region"
  }
  @update_attrs %{
    region: "some updated region"
  }
  @invalid_attrs %{region: nil}

  def fixture(:game_room) do
    {:ok, game_room} = Game.create_game_room(@create_attrs)
    game_room
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all game_rooms", %{conn: conn} do
      conn = get(conn, Routes.game_room_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game_room" do
    test "renders game_room when data is valid", %{conn: conn} do
      conn = post(conn, Routes.game_room_path(conn, :create), game_room: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.game_room_path(conn, :show, id))

      assert %{
               "id" => id,
               "region" => "some region"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.game_room_path(conn, :create), game_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game_room" do
    setup [:create_game_room]

    test "renders game_room when data is valid", %{conn: conn, game_room: %GameRoom{id: id} = game_room} do
      conn = put(conn, Routes.game_room_path(conn, :update, game_room), game_room: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.game_room_path(conn, :show, id))

      assert %{
               "id" => id,
               "region" => "some updated region"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game_room: game_room} do
      conn = put(conn, Routes.game_room_path(conn, :update, game_room), game_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game_room" do
    setup [:create_game_room]

    test "deletes chosen game_room", %{conn: conn, game_room: game_room} do
      conn = delete(conn, Routes.game_room_path(conn, :delete, game_room))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.game_room_path(conn, :show, game_room))
      end
    end
  end

  defp create_game_room(_) do
    game_room = fixture(:game_room)
    %{game_room: game_room}
  end
end
