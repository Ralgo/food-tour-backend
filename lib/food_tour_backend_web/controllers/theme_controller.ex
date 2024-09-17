defmodule FoodTourAppWeb.ThemeController do
  use FoodTourAppWeb, :controller
  use PhoenixSwagger

  alias FoodTourApp.Themes
  alias FoodTourApp.Themes.Theme

  action_fallback FoodTourAppWeb.FallbackController

  def swagger_definitions do
    %{
      Themes:
        swagger_schema do
          title("Theme")
          description("A tours theme. Ex. Vegan, Mexican, Crazy, Sweet, Spicy, Asian")

          properties do
            id(:string, "Theme's unique id", required: true)
            title(:string, "Theme's title", required: true)
            subtitle(:string, "Theme's short description", required: true)
            image(:string, "Theme's image for list display", required: true)
          end

          example(%{
            data: [
              %{
                id: 1,
                image:
                  "https://www.bestphysicaltherapistnyc.com/wp-content/uploads/2015/08/spicy-hot-peppers-eat-stock-today-150811-tease_f7b41454927b007b3a9be5e376161b7c.today-inline-large2x-e1439943727549.jpg",
                subtitle: "short description",
                title: "Spicy"
              },
              %{
                id: 2,
                image: "https://media.timeout.com/images/105937856/1920/1080/image.jpg",
                subtitle:
                  "short description for vegan food's tours where vegans can try vega stuffs",
                title: "Vegan"
              }
            ]
          })
        end
    }
  end

  swagger_path :index do
    get("/api/themes")
    description("List themes")
    response(200, "OK", Schema.ref(:Themes))
  end

  def index(conn, _params) do
    themes = Themes.list_themes()
    render(conn, :index, themes: themes)
  end

  def create(conn, %{"theme" => theme_params}) do
    with {:ok, %Theme{} = theme} <- Themes.create_theme(theme_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/themes/#{theme}")
      |> render(:show, theme: theme)
    end
  end

  def show(conn, %{"id" => id}) do
    theme = Themes.get_theme!(id)
    render(conn, :show, theme: theme)
  end

  def update(conn, %{"id" => id, "theme" => theme_params}) do
    theme = Themes.get_theme!(id)

    with {:ok, %Theme{} = theme} <- Themes.update_theme(theme, theme_params) do
      render(conn, :show, theme: theme)
    end
  end

  def delete(conn, %{"id" => id}) do
    theme = Themes.get_theme!(id)

    with {:ok, %Theme{}} <- Themes.delete_theme(theme) do
      send_resp(conn, :no_content, "")
    end
  end
end
