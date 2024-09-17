defmodule FoodTourAppWeb.Router do
  use FoodTourAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodTourAppWeb do
    pipe_through :api
    get("/health-check", HealthCheckController, :index)
    resources "/themes", ThemeController, except: [:new, :edit]
    resources "/tours", TourController, except: [:new, :edit]
    post "/tours/generate_tour", TourController, :generate_tour
    post "/tours/create_tour", TourController, :create_tour
    resources "/dishes", DishController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/waypoints", WaypointController, except: [:new, :edit]

  end

  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :food_tour_backend,
      swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      info: %{
        basePath: "/api",
        version: "1.0",
        title: "Food Tour API"
      }
    }
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:food_tour_backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FoodTourAppWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
