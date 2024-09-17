defmodule FoodTourApp.ThemesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTourApp.Themes` context.
  """

  @doc """
  Generate a theme.
  """
  def theme_fixture(attrs \\ %{}) do
    {:ok, theme} =
      attrs
      |> Enum.into(%{
        image: "some image",
        subtitle: "some subtitle",
        title: "some title"
      })
      |> FoodTourApp.Themes.create_theme()

    theme
  end
end
