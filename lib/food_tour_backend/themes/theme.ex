defmodule FoodTourApp.Themes.Theme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "themes" do
    field :image, :string
    field :subtitle, :string
    field :title, :string

    many_to_many :dishes, FoodTourApp.Dishes.Dish,
      join_through: "dish_themes",
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(theme, attrs) do
    theme
    |> cast(attrs, [:title, :subtitle, :image])
    |> cast_assoc(:dishes, required: false)
    |> validate_required([:title, :subtitle, :image])
  end
end
