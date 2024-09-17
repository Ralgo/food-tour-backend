defmodule FoodTourApp.TourDish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tours_dishes" do
    belongs_to :tour, FoodTourApp.Tours.Tour
    belongs_to :dish, FoodTourApp.Dishes.Dish
    field :order, :integer

    timestamps()
  end

  def changeset(tour_dish, attrs) do
    tour_dish
    |> cast(attrs, [:tour_id, :dish_id])
    |> validate_required([:tour_id, :dish_id])
  end
end
