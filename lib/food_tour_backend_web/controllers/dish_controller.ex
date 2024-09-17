defmodule FoodTourAppWeb.DishController do
  use FoodTourAppWeb, :controller
  use PhoenixSwagger

  alias FoodTourApp.Dishes
  alias FoodTourApp.Dishes.Dish

  action_fallback FoodTourAppWeb.FallbackController

  def swagger_definitions do
    %{
      Dishes:
        swagger_schema do
          title("Dishes")
          description("A food dish used as a tour path element")

          properties do
            id(:string, "Dish's unique id", required: true)
            title(:string, "Dish's title", required: true)
            subtitle(:string, "Dish's short brief subtitle for panel list", required: true)
            description(:string, "Dish's short description", required: true)
            price(:number, "Dish's price", required: true)

            image(:string, "Dish's image for list display", required: true)
          end

          example(%{
            data: [
              %{
                updated_at: "2023-09-14T09:15:29",
                themes: [
                  %{
                    updated_at: "2023-09-13T21:53:32",
                    title: "Spicy",
                    subtitle: "short description",
                    inserted_at: "2023-09-13T21:53:32",
                    image: "https://www.bestphysicaltherapistnyc.com/wp-content/uploads/2015/08/spicy-hot-peppers-eat-stock-today-150811-tease_f7b41454927b007b3a9be5e376161b7c.today-inline-large2x-e1439943727549.jpg",
                    id: 1
                  }
                ],
                price: "20000.00",
                location_id: 1,
                location: %{
                  updated_at: "2023-09-14T10:08:06",
                  merchant_name: "Merchant name",
                  long: -36.000,
                  lat: 16.2222,
                  inserted_at: "2023-09-14T10:08:06",
                  image: " :string",
                  id: 1,
                  description: "location ",
                },
                name: "Kimchi",
                inserted_at: "2023-09-14T09:15:29",
                image: "https://okdiario.com/img/2016/12/01/kimchi-655x368.jpg",
                id: 11,
                description: "Delicious plate from korea vegan and spicy"
              }
            ]

          })
        end
    }
  end

  swagger_path :index do
    get("/api/dishes")
    description("List dishes")
    response(200, "OK", Schema.ref(:Dishes))
  end

  def index(conn, _params) do

    dishes =
      Dishes.list_dishes()
      |> Enum.map(fn dish ->
        dish
        |> Map.delete(:__meta__)
        |> Map.delete(:tours)
        |> Map.put(:price, Float.to_string(dish.price, decimals: 2))
        |> Map.put(
          :themes,
          Enum.map(dish.themes, fn themes -> themes |> Map.delete(:__meta__) end))
        |> Map.put(
             :location,
             Map.drop(dish.location, [:dishes, :__meta__])
             |> Map.put(:lat, String.to_float(dish.location.lat))
             |> Map.put(:long, String.to_float(dish.location.long))
        )

      end)
      |> Poison.encode!()
    conn
    |> put_resp_header("accept", "application/json")
    |> send_resp( :ok, dishes)
  end

  def create(conn, %{"dish" => dish_params}) do
    with {:ok, %Dish{} = dish} <- Dishes.create_dish(dish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/dishes/#{dish}")
      |> render(:show, dish: dish)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)
    render(conn, :show, dish: dish)
  end

  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{} = dish} <- Dishes.update_dish(dish, dish_params) do
      render(conn, :show, dish: dish)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{}} <- Dishes.delete_dish(dish) do
      send_resp(conn, :no_content, "")
    end
  end
end
