defmodule VirtualGymWeb.RoutineControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.RoutinesFixtures

  alias VirtualGym.Routines.Routine

  @create_attrs %{
    date: "some date",
    suggested_date: "some suggested_date"
  }
  @update_attrs %{
    date: "some updated date",
    suggested_date: "some updated suggested_date"
  }
  @invalid_attrs %{date: nil, suggested_date: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routines", %{conn: conn} do
      conn = get(conn, ~p"/api/routines")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create routine" do
    test "renders routine when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/routines", routine: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/routines/#{id}")

      assert %{
               "id" => ^id,
               "date" => "some date",
               "suggested_date" => "some suggested_date"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/routines", routine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update routine" do
    setup [:create_routine]

    test "renders routine when data is valid", %{conn: conn, routine: %Routine{id: id} = routine} do
      conn = put(conn, ~p"/api/routines/#{routine}", routine: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/routines/#{id}")

      assert %{
               "id" => ^id,
               "date" => "some updated date",
               "suggested_date" => "some updated suggested_date"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, routine: routine} do
      conn = put(conn, ~p"/api/routines/#{routine}", routine: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete routine" do
    setup [:create_routine]

    test "deletes chosen routine", %{conn: conn, routine: routine} do
      conn = delete(conn, ~p"/api/routines/#{routine}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/routines/#{routine}")
      end
    end
  end

  defp create_routine(_) do
    routine = routine_fixture()
    %{routine: routine}
  end
end
