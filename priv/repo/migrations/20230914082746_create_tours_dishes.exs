defmodule FoodTourApp.Repo.Migrations.CreateToursDishes do
  use Ecto.Migration

  def change do
    create table(:tours_dishes, primary_key: false) do
      add :tour_id, references(:tours, on_delete: :nothing)
      add :dish_id, references(:dishes, on_delete: :nothing)
      add :order, :integer
    end

    create unique_index(:tours_dishes, [:tour_id, :dish_id])
  end
end
