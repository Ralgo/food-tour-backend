defmodule FoodTourApp.Repo.Migrations.RemoveBookingsTable do
  use Ecto.Migration

  def change do
    drop table("bookings")
  end
end
