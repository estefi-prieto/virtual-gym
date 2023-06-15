defmodule VirtualGymWeb.SuperSerieControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.SuperSeriesFixtures

  alias VirtualGym.SuperSeries.SuperSerie

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all super_series", %{conn: conn} do
      conn = get(conn, ~p"/api/super_series")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create super_serie" do
    test "renders super_serie when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/super_series", super_serie: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/super_series/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/super_series", super_serie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update super_serie" do
    setup [:create_super_serie]

    test "renders super_serie when data is valid", %{conn: conn, super_serie: %SuperSerie{id: id} = super_serie} do
      conn = put(conn, ~p"/api/super_series/#{super_serie}", super_serie: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/super_series/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, super_serie: super_serie} do
      conn = put(conn, ~p"/api/super_series/#{super_serie}", super_serie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete super_serie" do
    setup [:create_super_serie]

    test "deletes chosen super_serie", %{conn: conn, super_serie: super_serie} do
      conn = delete(conn, ~p"/api/super_series/#{super_serie}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/super_series/#{super_serie}")
      end
    end
  end

  defp create_super_serie(_) do
    super_serie = super_serie_fixture()
    %{super_serie: super_serie}
  end
end
