defmodule FoodTourAppWeb.ThemeJSON do
  alias FoodTourApp.Themes.Theme

  @doc """
  Renders a list of themes.
  """
  def index(%{themes: themes}) do
    %{data: for(theme <- themes, do: data(theme))}
  end

  @doc """
  Renders a single theme.
  """
  def show(%{theme: theme}) do
    %{data: data(theme)}
  end

  defp data(%Theme{} = theme) do
    %{
      id: theme.id,
      title: theme.title,
      subtitle: theme.subtitle,
      image: theme.image
    }
  end
end
