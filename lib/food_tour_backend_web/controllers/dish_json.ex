defmodule FoodTourAppWeb.DishJSON do
  alias FoodTourApp.Dishes.Dish

  @doc """
  Renders a list of dishes.
  """
  def index(%{dishes: dishes}) do
    %{data: for(dish <- dishes, do: data(dish))}
  end

  @doc """
  Renders a single dish.
  """
  def show(%{dish: dish}) do
    %{data: data(dish)}
  end

  defp data(%Dish{} = dish) do
    %{
      id: dish.id,
      name: dish.name,
      image: dish.image,
      price: Float.to_string(dish.price, decimals: 2),
      description: dish.description
    }
  end
end
