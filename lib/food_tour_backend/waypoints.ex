defmodule FoodTourApp.Waypoints do
  @moduledoc """
  The Waypoints context.
  """

  import Ecto.Query, warn: false
  alias FoodTourApp.Repo

  alias FoodTourApp.Waypoints.Waypoint

  @doc """
  Returns the list of waypoints.

  ## Examples

      iex> list_waypoints()
      [%Waypoint{}, ...]

  """
  def list_waypoints do
    Repo.all(Waypoint)
  end

  @doc """
  Gets a single waypoint.

  Raises `Ecto.NoResultsError` if the Waypoint does not exist.

  ## Examples

      iex> get_waypoint!(123)
      %Waypoint{}

      iex> get_waypoint!(456)
      ** (Ecto.NoResultsError)

  """
  def get_waypoint!(id), do: Repo.get!(Waypoint, id)

  @doc """
  Creates a waypoint.

  ## Examples

      iex> create_waypoint(%{field: value})
      {:ok, %Waypoint{}}

      iex> create_waypoint(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_waypoint(attrs \\ %{}) do
    %Waypoint{}
    |> Waypoint.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a waypoint.

  ## Examples

      iex> update_waypoint(waypoint, %{field: new_value})
      {:ok, %Waypoint{}}

      iex> update_waypoint(waypoint, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_waypoint(%Waypoint{} = waypoint, attrs) do
    waypoint
    |> Waypoint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a waypoint.

  ## Examples

      iex> delete_waypoint(waypoint)
      {:ok, %Waypoint{}}

      iex> delete_waypoint(waypoint)
      {:error, %Ecto.Changeset{}}

  """
  def delete_waypoint(%Waypoint{} = waypoint) do
    Repo.delete(waypoint)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking waypoint changes.

  ## Examples

      iex> change_waypoint(waypoint)
      %Ecto.Changeset{data: %Waypoint{}}

  """
  def change_waypoint(%Waypoint{} = waypoint, attrs \\ %{}) do
    Waypoint.changeset(waypoint, attrs)
  end
end
