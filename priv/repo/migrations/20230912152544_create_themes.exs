defmodule FoodTourApp.Repo.Migrations.CreateThemes do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :title, :string
      add :subtitle, :string
      add :image, :string

      timestamps()
    end
  end
end
