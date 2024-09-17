defmodule FoodTourAppWeb.TourJSON do
  alias FoodTourApp.Tours.Tour

  @doc """
  Renders a list of tours.
  """
  def index(%{tours: tours}) do
    %{data: for(tour <- tours, do: data(tour))}
  end

  @doc """
  Renders a single tour.
  """
  def show(%{tour: tour}) do
    %{data: data(tour)}
  end

  defp data(%Tour{} = tour) do
    %{
      id: tour.id,
      name: tour.name,
      price: tour.price,
      estimated_time: tour.estimated_time
    }
  end
end
