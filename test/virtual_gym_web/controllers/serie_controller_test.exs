defmodule VirtualGymWeb.SerieControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.SeriesFixtures

  alias VirtualGym.Series.Serie

  @create_attrs %{
    note: "some note",
    status: "some status"
  }
  @update_attrs %{
    note: "some updated note",
    status: "some updated status"
  }
  @invalid_attrs %{note: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all series", %{conn: conn} do
      conn = get(conn, ~p"/api/series")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create serie" do
    test "renders serie when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/series", serie: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/series/#{id}")

      assert %{
               "id" => ^id,
               "note" => "some note",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/series", serie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update serie" do
    setup [:create_serie]

    test "renders serie when data is valid", %{conn: conn, serie: %Serie{id: id} = serie} do
      conn = put(conn, ~p"/api/series/#{serie}", serie: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/series/#{id}")

      assert %{
               "id" => ^id,
               "note" => "some updated note",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, serie: serie} do
      conn = put(conn, ~p"/api/series/#{serie}", serie: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete serie" do
    setup [:create_serie]

    test "deletes chosen serie", %{conn: conn, serie: serie} do
      conn = delete(conn, ~p"/api/series/#{serie}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/series/#{serie}")
      end
    end
  end

  defp create_serie(_) do
    serie = serie_fixture()
    %{serie: serie}
  end
end
