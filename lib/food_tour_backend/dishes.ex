defmodule FoodTourApp.Dishes do
  @moduledoc """
  The Dishes context.
  """

  import Ecto.Query, warn: false
  alias FoodTourApp.Repo

  alias FoodTourApp.Dishes.Dish
  alias FoodTourApp.Themes.Theme

  @doc """
  Returns the list of dishes.

  ## Examples

      iex> list_dishes()
      [%Dish{}, ...]

  """
  def list_dishes do
    Repo.all(from d in Dish, preload: [:themes, :location])
    |> Enum.map(fn dish ->
      Map.put(dish, :themes, Enum.map(dish.themes, fn theme -> Map.delete(theme, :dishes) end))
    end)
  end

  @doc """
  Gets a single dish.

  Raises `Ecto.NoResultsError` if the Dish does not exist.

  ## Examples

      iex> get_dish!(123)
      %Dish{}

      iex> get_dish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dish!(id) do
    Repo.get!(Dish, id)
    |> Repo.preload([:locations])
  end

  @doc """
  Creates a dish.

  ## Examples

      iex> create_dish(%{field: value})
      {:ok, %Dish{}}

      iex> create_dish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dish(%{"themes" => themes} = attrs) do
    themes_to_assoc =
      for theme <- themes do
        %Theme{id: theme["id"], __meta__: %Ecto.Schema.Metadata{source: "themes", state: :loaded}}
      end

    %Dish{}
    |> Dish.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:themes, themes_to_assoc)
    |> Repo.insert()
  end

  @doc """
  Updates a dish.

  ## Examples

      iex> update_dish(dish, %{field: new_value})
      {:ok, %Dish{}}

      iex> update_dish(dish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dish(%Dish{} = dish, attrs) do
    dish
    |> Dish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dish.

  ## Examples

      iex> delete_dish(dish)
      {:ok, %Dish{}}

      iex> delete_dish(dish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dish(%Dish{} = dish) do
    Repo.delete(dish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dish changes.

  ## Examples

      iex> change_dish(dish)
      %Ecto.Changeset{data: %Dish{}}

  """
  def change_dish(%Dish{} = dish, attrs \\ %{}) do
    Dish.changeset(dish, attrs)
  end
end
