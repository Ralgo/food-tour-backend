defmodule FoodTourApp.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTourApp.Locations` context.
  """

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some image",
        lat: "some lat",
        long: "some long",
        merchant_name: "some merchant_name"
      })
      |> FoodTourApp.Locations.create_location()

    location
  end
end
