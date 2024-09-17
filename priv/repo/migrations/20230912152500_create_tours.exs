defmodule FoodTourApp.Repo.Migrations.CreateTours do
  use Ecto.Migration

  def change do
    create table(:tours) do
      add :name, :string
      add :price, :float
      add :estimated_time, :integer

      timestamps()
    end
  end
end
