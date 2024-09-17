defmodule FoodTourApp.DishThemes.DishTheme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dish_themes" do
    belongs_to :dish, FoodTourApp.Dishes.Dish
    belongs_to :theme, FoodTourApp.Themes.Theme
    # timestamps()
  end

  @doc false
  def changeset(dish_themes, attrs) do
    dish_themes
    |> cast(attrs, [:dish_id, :theme_id])
    |> validate_required([:dish_id, :theme_id])
  end
end
