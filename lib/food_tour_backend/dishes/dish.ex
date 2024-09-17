defmodule FoodTourApp.Dishes.Dish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dishes" do
    field :description, :string
    field :image, :string
    field :name, :string
    field :price, :float

    many_to_many :themes, FoodTourApp.Themes.Theme,
      join_through: "dish_themes",
      on_replace: :delete

    belongs_to :location, FoodTourApp.Locations.Location
    many_to_many :tours, FoodTourApp.Tours.Tour, join_through: "tours_dishes"

    timestamps()
  end

  @doc false
  def changeset(dish, attrs) do
    dish
    |> cast(attrs, [:name, :image, :description, :location_id, :price])
    |> validate_required([:name, :image, :description, :location_id, :price])
  end
end
