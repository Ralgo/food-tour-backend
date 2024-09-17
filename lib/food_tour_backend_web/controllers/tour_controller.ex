defmodule FoodTourAppWeb.TourController do
  use FoodTourAppWeb, :controller
  use PhoenixSwagger

  alias FoodTourApp.Tours
  alias FoodTourApp.Tours.Tour
  alias FoodTourAppWeb.Fixtures.TourJson

  action_fallback FoodTourAppWeb.FallbackController

  def swagger_definitions do
    %{
      Tour:
        swagger_schema do
          title("Tour")
          description("Tour element")

          properties do
            id(:string, "Tour unique id", required: true)
            estimated_time(:number, "Tour estimated total time duration", required: true)
            name(:string, "Tour name", required: true)
            price(:number, "Dish's total price", required: true)
            waypoint(:array, "Waypoints", required: true)
          end

          example(%{
            "tour" => %{
              "estimated_time" => 1234,
              "name" => "Sweet Thooth",
              "price" => 1700,
              "waypoints" => [
                %{
                  "description" => "Delicious Hazelnut- Raspberry Cake",
                  "dish_id" => 1,
                  "eta" => 25,
                  "image" =>
                    "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRed-HazelNutRaspeberryCake.jpeg?raw=true",
                  "inserted_at" => "2023-09-14T12:28:27",
                  "location" => %{
                    "description" => "Bulgarian Cuisine",
                    "id" => 1,
                    "image" =>
                      "https://github.com/stephfz/hk-images/blob/main/imgs/HKW2023/ShadesOfRed/ShadesOfRead-RestHeader.jpeg?raw=true",
                    "inserted_at" => "2023-09-14T11:47:19",
                    "lat" => 42.696558840340266,
                    "long" => 23.325950390074755,
                    "merchant_name" => "Shades of Red Restaurant",
                    "updated_at" => "2023-09-14T11:47:19"
                  },
                  "location_id" => 1,
                  "name" => "Hazelnut- Raspberry Cake",
                  "order" => 1,
                  "price" => "4000.00",
                  "themes" => [
                    %{
                      "id" => 8,
                      "image" =>
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOzM9cWXRoP9iqbW-GVOr8ESYxR_ZJ2XTZA&usqp=CAU",
                      "inserted_at" => "2023-09-14T12:24:59",
                      "subtitle" => "Treat yourself with some sugary sweets ",
                      "title" => "Sweet Tooth",
                      "updated_at" => "2023-09-14T12:24:59"
                    }
                  ],
                  "updated_at" => "2023-09-14T12:28:27"
                }
              ]
            }
          })
        end
    }
  end

  swagger_path :generate_tour do
    post("/api/tours/generate_tour")
    description("Fetches a new tour")
    response(200, "OK", Schema.ref(:Tour))
  end

  swagger_path :create_tour do
    post("/api/tours/create_tour")
    description("Generate a new tour")
    response(200, "OK", Schema.ref(:Tour))
  end

  def index(conn, _params) do
    tours = Tours.list_tours()
    render(conn, :index, tours: tours)
  end

  def create(conn, %{"tour" => tour_params}) do
    with {:ok, %Tour{} = tour} <- Tours.create_tour(tour_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tours/#{tour}")
      |> render(:show, tour: tour)
    end
  end

  def show(conn, %{"id" => id}) do
    tour = Tours.get_tour!(id)
    render(conn, :show, tour: tour)
  end

  def update(conn, %{"id" => id, "tour" => tour_params}) do
    tour = Tours.get_tour!(id)

    with {:ok, %Tour{} = tour} <- Tours.update_tour(tour, tour_params) do
      render(conn, :show, tour: tour)
    end
  end

  def delete(conn, %{"id" => id}) do
    tour = Tours.get_tour!(id)

    with {:ok, %Tour{}} <- Tours.delete_tour(tour) do
      send_resp(conn, :no_content, "")
    end
  end

  def generate_tour(conn, _params) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(:ok, TourJson.get_tour() |> Poison.encode!())
  end

  def create_tour(conn, %{"tour" => params}) do
    with {:ok, %Tour{} = tour} <- Tours.create_tour(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tours/#{tour}")
      |> render(:show, tour: tour)
    end
  end
end
