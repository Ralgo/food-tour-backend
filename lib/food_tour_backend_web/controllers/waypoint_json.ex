defmodule FoodTourAppWeb.WaypointJSON do
  alias FoodTourApp.Waypoints.Waypoint

  @doc """
  Renders a list of waypoints.
  """
  def index(%{waypoints: waypoints}) do
    %{data: for(waypoint <- waypoints, do: data(waypoint))}
  end

  @doc """
  Renders a single waypoint.
  """
  def show(%{waypoint: waypoint}) do
    %{data: data(waypoint)}
  end

  defp data(%Waypoint{} = waypoint) do
    %{
      id: waypoint.id,
      order: waypoint.order,
      eta: waypoint.eta
    }
  end
end
