defmodule FoodTourApp.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :description, :string
    field :image, :string
    field :lat, :string
    field :long, :string
    field :merchant_name, :string
    has_many :dishes, FoodTourApp.Dishes.Dish

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:merchant_name, :lat, :long, :image, :description])
    |> validate_required([:merchant_name, :lat, :long, :image, :description])
  end
end
