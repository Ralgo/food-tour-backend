defmodule FoodTourApp.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :merchant_name, :string
      add :lat, :string
      add :long, :string
      add :image, :string
      add :description, :string

      timestamps()
    end
  end
end
