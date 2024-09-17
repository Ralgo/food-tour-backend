defmodule FoodTourApp.ThemesTest do
  use FoodTourApp.DataCase

  alias FoodTourApp.Themes

  describe "themes" do
    alias FoodTourApp.Themes.Theme

    import FoodTourApp.ThemesFixtures

    @invalid_attrs %{image: nil, subtitle: nil, title: nil}

    test "list_themes/0 returns all themes" do
      theme = theme_fixture()
      assert Themes.list_themes() == [theme]
    end

    test "get_theme!/1 returns the theme with given id" do
      theme = theme_fixture()
      assert Themes.get_theme!(theme.id) == theme
    end

    test "create_theme/1 with valid data creates a theme" do
      valid_attrs = %{image: "some image", subtitle: "some subtitle", title: "some title"}

      assert {:ok, %Theme{} = theme} = Themes.create_theme(valid_attrs)
      assert theme.image == "some image"
      assert theme.subtitle == "some subtitle"
      assert theme.title == "some title"
    end

    test "create_theme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Themes.create_theme(@invalid_attrs)
    end

    test "update_theme/2 with valid data updates the theme" do
      theme = theme_fixture()

      update_attrs = %{
        image: "some updated image",
        subtitle: "some updated subtitle",
        title: "some updated title"
      }

      assert {:ok, %Theme{} = theme} = Themes.update_theme(theme, update_attrs)
      assert theme.image == "some updated image"
      assert theme.subtitle == "some updated subtitle"
      assert theme.title == "some updated title"
    end

    test "update_theme/2 with invalid data returns error changeset" do
      theme = theme_fixture()
      assert {:error, %Ecto.Changeset{}} = Themes.update_theme(theme, @invalid_attrs)
      assert theme == Themes.get_theme!(theme.id)
    end

    test "delete_theme/1 deletes the theme" do
      theme = theme_fixture()
      assert {:ok, %Theme{}} = Themes.delete_theme(theme)
      assert_raise Ecto.NoResultsError, fn -> Themes.get_theme!(theme.id) end
    end

    test "change_theme/1 returns a theme changeset" do
      theme = theme_fixture()
      assert %Ecto.Changeset{} = Themes.change_theme(theme)
    end
  end
end
