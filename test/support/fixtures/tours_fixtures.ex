defmodule FoodTourApp.ToursFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTourApp.Tours` context.
  """

  @doc """
  Generate a tour.
  """
  def tour_fixture(attrs \\ %{}) do
    {:ok, tour} =
      attrs
      |> Enum.into(%{
        estimated_time: 42,
        name: "some name",
        price: 120.5
      })
      |> FoodTourApp.Tours.create_tour()

    tour
  end
end
