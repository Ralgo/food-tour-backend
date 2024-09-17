defmodule FoodTourAppWeb.WaypointControllerTest do
  use FoodTourAppWeb.ConnCase

  import FoodTourApp.WaypointsFixtures

  alias FoodTourApp.Waypoints.Waypoint

  @create_attrs %{
    eta: 42,
    order: 42
  }
  @update_attrs %{
    eta: 43,
    order: 43
  }
  @invalid_attrs %{eta: nil, order: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all waypoints", %{conn: conn} do
      conn = get(conn, ~p"/api/waypoints")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create waypoint" do
    test "renders waypoint when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/waypoints", waypoint: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/waypoints/#{id}")

      assert %{
               "id" => ^id,
               "eta" => 42,
               "order" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/waypoints", waypoint: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update waypoint" do
    setup [:create_waypoint]

    test "renders waypoint when data is valid", %{conn: conn, waypoint: %Waypoint{id: id} = waypoint} do
      conn = put(conn, ~p"/api/waypoints/#{waypoint}", waypoint: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/waypoints/#{id}")

      assert %{
               "id" => ^id,
               "eta" => 43,
               "order" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, waypoint: waypoint} do
      conn = put(conn, ~p"/api/waypoints/#{waypoint}", waypoint: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete waypoint" do
    setup [:create_waypoint]

    test "deletes chosen waypoint", %{conn: conn, waypoint: waypoint} do
      conn = delete(conn, ~p"/api/waypoints/#{waypoint}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/waypoints/#{waypoint}")
      end
    end
  end

  defp create_waypoint(_) do
    waypoint = waypoint_fixture()
    %{waypoint: waypoint}
  end
end
