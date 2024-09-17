defmodule FoodTourApp.DishesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTourApp.Dishes` context.
  """

  @doc """
  Generate a dish.
  """
  def dish_fixture(attrs \\ %{}) do
    {:ok, dish} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        name: "some name"
      })
      |> FoodTourApp.Dishes.create_dish()

    dish
  end
end
