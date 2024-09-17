defmodule FoodTourApp.Waypoints.Waypoint do
  use Ecto.Schema
  import Ecto.Changeset

  schema "waypoints" do
    field :eta, :integer
    field :order, :integer

    belongs_to :tour, FoodTourApp.Tours.Tour

    timestamps()
  end

  @doc false
  def changeset(waypoint, attrs) do
    waypoint
    |> cast(attrs, [:order, :eta])
    |> validate_required([:order, :eta])
  end
end
