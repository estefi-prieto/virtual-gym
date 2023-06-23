defmodule VirtualGymWeb.ActivityControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.ActivitiesFixtures

  alias VirtualGym.Activities.Activity

  @create_attrs %{
    order: 42,
    rounds: 42
  }
  @update_attrs %{
    order: 43,
    rounds: 43
  }
  @invalid_attrs %{order: nil, rounds: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all activities", %{conn: conn} do
      conn = get(conn, ~p"/api/activities")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create activity" do
    test "renders activity when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/activities", activity: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/activities/#{id}")

      assert %{
               "id" => ^id,
               "order" => 42,
               "rounds" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/activities", activity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update activity" do
    setup [:create_activity]

    test "renders activity when data is valid", %{
      conn: conn,
      activity: %Activity{id: id} = activity
    } do
      conn = put(conn, ~p"/api/activities/#{activity}", activity: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/activities/#{id}")

      assert %{
               "id" => ^id,
               "order" => 43,
               "rounds" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, activity: activity} do
      conn = put(conn, ~p"/api/activities/#{activity}", activity: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete activity" do
    setup [:create_activity]

    test "deletes chosen activity", %{conn: conn, activity: activity} do
      conn = delete(conn, ~p"/api/activities/#{activity}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/activities/#{activity}")
      end
    end
  end

  defp create_activity(_) do
    activity = activity_fixture()
    %{activity: activity}
  end
end
