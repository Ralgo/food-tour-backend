defmodule FoodTourApp.LocationsTest do
  use FoodTourApp.DataCase

  alias FoodTourApp.Locations

  describe "locations" do
    alias FoodTourApp.Locations.Location

    import FoodTourApp.LocationsFixtures

    @invalid_attrs %{description: nil, image: nil, lat: nil, long: nil, merchant_name: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{
        description: "some description",
        image: "some image",
        lat: "some lat",
        long: "some long",
        merchant_name: "some merchant_name"
      }

      assert {:ok, %Location{} = location} = Locations.create_location(valid_attrs)
      assert location.description == "some description"
      assert location.image == "some image"
      assert location.lat == "some lat"
      assert location.long == "some long"
      assert location.merchant_name == "some merchant_name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()

      update_attrs = %{
        description: "some updated description",
        image: "some updated image",
        lat: "some updated lat",
        long: "some updated long",
        merchant_name: "some updated merchant_name"
      }

      assert {:ok, %Location{} = location} = Locations.update_location(location, update_attrs)
      assert location.description == "some updated description"
      assert location.image == "some updated image"
      assert location.lat == "some updated lat"
      assert location.long == "some updated long"
      assert location.merchant_name == "some updated merchant_name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end
