defmodule FoodTourApp.Repo do
  use Ecto.Repo,
    otp_app: :food_tour_backend,
    adapter: Ecto.Adapters.Postgres
end
