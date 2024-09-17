defmodule FoodTourApp.Repo.Migrations.CreateDishes do
  use Ecto.Migration

  def change do
    create table(:dishes) do
      add :name, :string
      add :image, :string
      add :description, :string

      timestamps()
    end
  end
end
