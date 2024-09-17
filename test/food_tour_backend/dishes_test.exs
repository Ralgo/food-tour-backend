defmodule FoodTourApp.DishesTest do
  use FoodTourApp.DataCase

  alias FoodTourApp.Dishes

  describe "dishes" do
    alias FoodTourApp.Dishes.Dish

    import FoodTourApp.DishesFixtures

    @invalid_attrs %{description: nil, image: nil, name: nil}

    test "list_dishes/0 returns all dishes" do
      dish = dish_fixture()
      assert Dishes.list_dishes() == [dish]
    end

    test "get_dish!/1 returns the dish with given id" do
      dish = dish_fixture()
      assert Dishes.get_dish!(dish.id) == dish
    end

    test "create_dish/1 with valid data creates a dish" do
      valid_attrs = %{description: "some description", image: "some image", name: "some name"}

      assert {:ok, %Dish{} = dish} = Dishes.create_dish(valid_attrs)
      assert dish.description == "some description"
      assert dish.image == "some image"
      assert dish.name == "some name"
    end

    test "create_dish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dishes.create_dish(@invalid_attrs)
    end

    test "update_dish/2 with valid data updates the dish" do
      dish = dish_fixture()

      update_attrs = %{
        description: "some updated description",
        image: "some updated image",
        name: "some updated name"
      }

      assert {:ok, %Dish{} = dish} = Dishes.update_dish(dish, update_attrs)
      assert dish.description == "some updated description"
      assert dish.image == "some updated image"
      assert dish.name == "some updated name"
    end

    test "update_dish/2 with invalid data returns error changeset" do
      dish = dish_fixture()
      assert {:error, %Ecto.Changeset{}} = Dishes.update_dish(dish, @invalid_attrs)
      assert dish == Dishes.get_dish!(dish.id)
    end

    test "delete_dish/1 deletes the dish" do
      dish = dish_fixture()
      assert {:ok, %Dish{}} = Dishes.delete_dish(dish)
      assert_raise Ecto.NoResultsError, fn -> Dishes.get_dish!(dish.id) end
    end

    test "change_dish/1 returns a dish changeset" do
      dish = dish_fixture()
      assert %Ecto.Changeset{} = Dishes.change_dish(dish)
    end
  end
end
