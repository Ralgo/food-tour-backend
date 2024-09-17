defmodule FoodTourApp.Tours.Tour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tours" do
    field :estimated_time, :integer
    field :name, :string
    field :price, :float

    has_many :waypoints, FoodTourApp.Waypoints.Waypoint, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(tour, attrs) do
    tour
    |> cast(attrs, [:name, :price, :estimated_time])
    |> validate_required([:name, :price, :estimated_time])
    |> cast_assoc(:waypoints)
  end
end
