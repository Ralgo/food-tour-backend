defmodule FoodTourApp.Repo.Migrations.AddLocationToDish do
  use Ecto.Migration

  def change do
    alter table(:dishes) do
      add :location_id, references(:locations, on_delete: :nothing)
    end
  end
end
