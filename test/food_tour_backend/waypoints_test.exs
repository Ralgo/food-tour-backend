defmodule FoodTourApp.WaypointsTest do
  use FoodTourApp.DataCase

  alias FoodTourApp.Waypoints

  describe "waypoints" do
    alias FoodTourApp.Waypoints.Waypoint

    import FoodTourApp.WaypointsFixtures

    @invalid_attrs %{eta: nil, order: nil}

    test "list_waypoints/0 returns all waypoints" do
      waypoint = waypoint_fixture()
      assert Waypoints.list_waypoints() == [waypoint]
    end

    test "get_waypoint!/1 returns the waypoint with given id" do
      waypoint = waypoint_fixture()
      assert Waypoints.get_waypoint!(waypoint.id) == waypoint
    end

    test "create_waypoint/1 with valid data creates a waypoint" do
      valid_attrs = %{eta: 42, order: 42}

      assert {:ok, %Waypoint{} = waypoint} = Waypoints.create_waypoint(valid_attrs)
      assert waypoint.eta == 42
      assert waypoint.order == 42
    end

    test "create_waypoint/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Waypoints.create_waypoint(@invalid_attrs)
    end

    test "update_waypoint/2 with valid data updates the waypoint" do
      waypoint = waypoint_fixture()
      update_attrs = %{eta: 43, order: 43}

      assert {:ok, %Waypoint{} = waypoint} = Waypoints.update_waypoint(waypoint, update_attrs)
      assert waypoint.eta == 43
      assert waypoint.order == 43
    end

    test "update_waypoint/2 with invalid data returns error changeset" do
      waypoint = waypoint_fixture()
      assert {:error, %Ecto.Changeset{}} = Waypoints.update_waypoint(waypoint, @invalid_attrs)
      assert waypoint == Waypoints.get_waypoint!(waypoint.id)
    end

    test "delete_waypoint/1 deletes the waypoint" do
      waypoint = waypoint_fixture()
      assert {:ok, %Waypoint{}} = Waypoints.delete_waypoint(waypoint)
      assert_raise Ecto.NoResultsError, fn -> Waypoints.get_waypoint!(waypoint.id) end
    end

    test "change_waypoint/1 returns a waypoint changeset" do
      waypoint = waypoint_fixture()
      assert %Ecto.Changeset{} = Waypoints.change_waypoint(waypoint)
    end
  end
end
