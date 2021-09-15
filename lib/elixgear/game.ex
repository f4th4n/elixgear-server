defmodule Elixgear.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Elixgear.Repo

  alias Elixgear.Game.GameRoom

  @doc """
  Returns the list of game_rooms.

  ## Examples

      iex> list_game_rooms()
      [%GameRoom{}, ...]

  """
  def list_game_rooms do
    Repo.all(GameRoom)
  end

  @doc """
  Gets a single game_room.

  Raises `Ecto.NoResultsError` if the Game room does not exist.

  ## Examples

      iex> get_game_room!(123)
      %GameRoom{}

      iex> get_game_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_room!(id), do: Repo.get!(GameRoom, id)

  @doc """
  Creates a game_room.

  ## Examples

      iex> create_game_room(%{field: value})
      {:ok, %GameRoom{}}

      iex> create_game_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_room(attrs \\ %{}) do
    %GameRoom{}
    |> GameRoom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_room.

  ## Examples

      iex> update_game_room(game_room, %{field: new_value})
      {:ok, %GameRoom{}}

      iex> update_game_room(game_room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_room(%GameRoom{} = game_room, attrs) do
    game_room
    |> GameRoom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_room.

  ## Examples

      iex> delete_game_room(game_room)
      {:ok, %GameRoom{}}

      iex> delete_game_room(game_room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_room(%GameRoom{} = game_room) do
    Repo.delete(game_room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_room changes.

  ## Examples

      iex> change_game_room(game_room)
      %Ecto.Changeset{data: %GameRoom{}}

  """
  def change_game_room(%GameRoom{} = game_room, attrs \\ %{}) do
    GameRoom.changeset(game_room, attrs)
  end
end
