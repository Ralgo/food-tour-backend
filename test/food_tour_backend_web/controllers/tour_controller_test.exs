defmodule FoodTourAppWeb.TourControllerTest do
  use FoodTourAppWeb.ConnCase

  import FoodTourApp.ToursFixtures

  alias FoodTourApp.Tours.Tour

  @create_attrs %{
    estimated_time: 42,
    name: "some name",
    price: 120.5
  }
  @update_attrs %{
    estimated_time: 43,
    name: "some updated name",
    price: 456.7
  }
  @invalid_attrs %{estimated_time: nil, id: nil, name: nil, price: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tours", %{conn: conn} do
      conn = get(conn, ~p"/api/tours")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tour" do
    test "renders tour when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tours", tour: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tours/#{id}")

      assert %{
               "id" => ^id,
               "estimated_time" => 42,
               "name" => "some name",
               "price" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/tours", tour: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tour" do
    setup [:create_tour]

    test "renders tour when data is valid", %{conn: conn, tour: %Tour{id: id} = tour} do
      conn = put(conn, ~p"/api/tours/#{tour}", tour: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tours/#{id}")

      assert %{
               "id" => ^id,
               "estimated_time" => 43,
               "name" => "some updated name",
               "price" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, tour: tour} do
      conn = put(conn, ~p"/api/tours/#{tour}", tour: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tour" do
    setup [:create_tour]

    test "deletes chosen tour", %{conn: conn, tour: tour} do
      conn = delete(conn, ~p"/api/tours/#{tour}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tours/#{tour}")
      end
    end
  end

  defp create_tour(_) do
    tour = tour_fixture()
    %{tour: tour}
  end
end
