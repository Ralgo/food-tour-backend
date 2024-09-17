defmodule FoodTourApp.Repo.Migrations.AlterDishAddPrice do
  use Ecto.Migration

  def change do
    alter table(:dishes) do
      add :price, :float
    end

  end
end
