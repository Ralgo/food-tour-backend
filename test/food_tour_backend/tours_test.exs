defmodule FoodTourApp.ToursTest do
  use FoodTourApp.DataCase

  alias FoodTourApp.Tours

  describe "tours" do
    alias FoodTourApp.Tours.Tour

    import FoodTourApp.ToursFixtures

    @invalid_attrs %{estimated_time: nil, name: nil, price: nil}

    test "list_tours/0 returns all tours" do
      tour = tour_fixture()
      assert Tours.list_tours() == [tour]
    end

    test "get_tour!/1 returns the tour with given id" do
      tour = tour_fixture()
      assert Tours.get_tour!(tour.id) == tour
    end

    test "create_tour/1 with valid data creates a tour" do
      valid_attrs = %{estimated_time: 42, name: "some name", price: 120.5}

      assert {:ok, %Tour{} = tour} = Tours.create_tour(valid_attrs)
      assert tour.estimated_time == 42
      assert tour.name == "some name"
      assert tour.price == 120.5
    end

    test "create_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tours.create_tour(@invalid_attrs)
    end

    test "update_tour/2 with valid data updates the tour" do
      tour = tour_fixture()
      update_attrs = %{estimated_time: 43, name: "some updated name", price: 456.7}

      assert {:ok, %Tour{} = tour} = Tours.update_tour(tour, update_attrs)
      assert tour.estimated_time == 43
      assert tour.name == "some updated name"
      assert tour.price == 456.7
    end

    test "update_tour/2 with invalid data returns error changeset" do
      tour = tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Tours.update_tour(tour, @invalid_attrs)
      assert tour == Tours.get_tour!(tour.id)
    end

    test "delete_tour/1 deletes the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{}} = Tours.delete_tour(tour)
      assert_raise Ecto.NoResultsError, fn -> Tours.get_tour!(tour.id) end
    end

    test "change_tour/1 returns a tour changeset" do
      tour = tour_fixture()
      assert %Ecto.Changeset{} = Tours.change_tour(tour)
    end
  end
end
