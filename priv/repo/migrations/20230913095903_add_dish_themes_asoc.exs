defmodule FoodTourApp.Repo.Migrations.AddDishThemesAsoc do
  use Ecto.Migration

  def change do
    create table("dish_themes", primary_key: false) do
      add :dish_id, references(:dishes, on_delete: :nothing)
      add :theme_id, references(:themes, on_delete: :nothing)
    end

    create(index(:dish_themes, [:dish_id]))
    create(index(:dish_themes, [:theme_id]))

    create(
      unique_index(:dish_themes, [:dish_id, :theme_id], name: :dish_id_theme_id_unique_index)
    )
  end
end
