defmodule FoodTourApp.WaypointsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTourApp.Waypoints` context.
  """

  @doc """
  Generate a waypoint.
  """
  def waypoint_fixture(attrs \\ %{}) do
    {:ok, waypoint} =
      attrs
      |> Enum.into(%{
        eta: 42,
        order: 42
      })
      |> FoodTourApp.Waypoints.create_waypoint()

    waypoint
  end
end
