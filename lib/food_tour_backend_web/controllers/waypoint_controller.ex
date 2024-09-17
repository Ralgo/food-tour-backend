defmodule FoodTourAppWeb.WaypointController do
  use FoodTourAppWeb, :controller

  alias FoodTourApp.Waypoints
  alias FoodTourApp.Waypoints.Waypoint

  action_fallback FoodTourAppWeb.FallbackController

  def index(conn, _params) do
    waypoints = Waypoints.list_waypoints()
    render(conn, :index, waypoints: waypoints)
  end

  def create(conn, %{"waypoint" => waypoint_params}) do
    with {:ok, %Waypoint{} = waypoint} <- Waypoints.create_waypoint(waypoint_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/waypoints/#{waypoint}")
      |> render(:show, waypoint: waypoint)
    end
  end

  def show(conn, %{"id" => id}) do
    waypoint = Waypoints.get_waypoint!(id)
    render(conn, :show, waypoint: waypoint)
  end

  def update(conn, %{"id" => id, "waypoint" => waypoint_params}) do
    waypoint = Waypoints.get_waypoint!(id)

    with {:ok, %Waypoint{} = waypoint} <- Waypoints.update_waypoint(waypoint, waypoint_params) do
      render(conn, :show, waypoint: waypoint)
    end
  end

  def delete(conn, %{"id" => id}) do
    waypoint = Waypoints.get_waypoint!(id)

    with {:ok, %Waypoint{}} <- Waypoints.delete_waypoint(waypoint) do
      send_resp(conn, :no_content, "")
    end
  end
end
