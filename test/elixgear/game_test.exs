defmodule Elixgear.GameTest do
  use Elixgear.DataCase

  alias Elixgear.Game

  describe "game_rooms" do
    alias Elixgear.Game.GameRoom

    @valid_attrs %{region: "some region"}
    @update_attrs %{region: "some updated region"}
    @invalid_attrs %{region: nil}

    def game_room_fixture(attrs \\ %{}) do
      {:ok, game_room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_game_room()

      game_room
    end

    test "list_game_rooms/0 returns all game_rooms" do
      game_room = game_room_fixture()
      assert Game.list_game_rooms() == [game_room]
    end

    test "get_game_room!/1 returns the game_room with given id" do
      game_room = game_room_fixture()
      assert Game.get_game_room!(game_room.id) == game_room
    end

    test "create_game_room/1 with valid data creates a game_room" do
      assert {:ok, %GameRoom{} = game_room} = Game.create_game_room(@valid_attrs)
      assert game_room.region == "some region"
    end

    test "create_game_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_game_room(@invalid_attrs)
    end

    test "update_game_room/2 with valid data updates the game_room" do
      game_room = game_room_fixture()
      assert {:ok, %GameRoom{} = game_room} = Game.update_game_room(game_room, @update_attrs)
      assert game_room.region == "some updated region"
    end

    test "update_game_room/2 with invalid data returns error changeset" do
      game_room = game_room_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_game_room(game_room, @invalid_attrs)
      assert game_room == Game.get_game_room!(game_room.id)
    end

    test "delete_game_room/1 deletes the game_room" do
      game_room = game_room_fixture()
      assert {:ok, %GameRoom{}} = Game.delete_game_room(game_room)
      assert_raise Ecto.NoResultsError, fn -> Game.get_game_room!(game_room.id) end
    end

    test "change_game_room/1 returns a game_room changeset" do
      game_room = game_room_fixture()
      assert %Ecto.Changeset{} = Game.change_game_room(game_room)
    end
  end
end
