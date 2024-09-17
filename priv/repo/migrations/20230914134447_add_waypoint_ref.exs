defmodule FoodTourApp.Repo.Migrations.AddWaypointRef do
  use Ecto.Migration

  def change do
    alter table(:waypoints) do
      add :tour_id, references(:tours, on_delete: :nothing)
    end
  end
end
