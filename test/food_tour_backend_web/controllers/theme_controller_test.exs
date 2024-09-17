defmodule FoodTourAppWeb.ThemeControllerTest do
  use FoodTourAppWeb.ConnCase

  import FoodTourApp.ThemesFixtures

  alias FoodTourApp.Themes.Theme

  @create_attrs %{
    image: "some image",
    subtitle: "some subtitle",
    title: "some title"
  }
  @update_attrs %{
    image: "some updated image",
    subtitle: "some updated subtitle",
    title: "some updated title"
  }
  @invalid_attrs %{id: nil, image: nil, subtitle: nil, title: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all themes", %{conn: conn} do
      conn = get(conn, ~p"/api/themes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create theme" do
    test "renders theme when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/themes", theme: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/themes/#{id}")

      assert %{
               "id" => ^id,
               "image" => "some image",
               "subtitle" => "some subtitle",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/themes", theme: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update theme" do
    setup [:create_theme]

    test "renders theme when data is valid", %{conn: conn, theme: %Theme{id: id} = theme} do
      conn = put(conn, ~p"/api/themes/#{theme}", theme: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/themes/#{id}")

      assert %{
               "id" => ^id,
               "image" => "some updated image",
               "subtitle" => "some updated subtitle",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, theme: theme} do
      conn = put(conn, ~p"/api/themes/#{theme}", theme: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete theme" do
    setup [:create_theme]

    test "deletes chosen theme", %{conn: conn, theme: theme} do
      conn = delete(conn, ~p"/api/themes/#{theme}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/themes/#{theme}")
      end
    end
  end

  defp create_theme(_) do
    theme = theme_fixture()
    %{theme: theme}
  end
end
