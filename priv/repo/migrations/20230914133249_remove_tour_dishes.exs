defmodule FoodTourApp.Repo.Migrations.RemoveTourDishes do
  use Ecto.Migration

  def change do
    drop table("tours_dishes")
  end
end
