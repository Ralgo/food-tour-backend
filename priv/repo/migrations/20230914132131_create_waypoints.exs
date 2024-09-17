defmodule FoodTourApp.Repo.Migrations.CreateWaypoints do
  use Ecto.Migration

  def change do
    create table(:waypoints) do
      add :order, :integer
      add :eta, :integer

      timestamps()
    end
  end
end
