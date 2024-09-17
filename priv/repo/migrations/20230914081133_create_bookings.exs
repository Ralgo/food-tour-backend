defmodule FoodTourApp.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :name, :string
      add :price, :float
      add :estimated_time, :integer
      add :tour_id, references(:tours, on_delete: :nothing)

      timestamps()
    end
  end
end
