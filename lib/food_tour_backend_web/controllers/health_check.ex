defmodule FoodTourAppWeb.HealthCheckController do
  use FoodTourAppWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
