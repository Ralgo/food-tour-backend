defmodule FoodTourAppWeb.LocationJSON do
  alias FoodTourApp.Locations.Location

  @doc """
  Renders a list of locations.
  """
  def index(%{locations: locations}) do
    %{data: for(location <- locations, do: data(location))}
  end

  @doc """
  Renders a single location.
  """
  def show(%{location: location}) do
    %{data: data(location)}
  end

  defp data(%Location{} = location) do
    %{
      id: location.id,
      merchant_name: location.merchant_name,
      lat: location.lat,
      long: location.long,
      image: location.image,
      description: location.description
    }
  end
end
