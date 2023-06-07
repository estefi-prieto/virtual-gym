defmodule VirtualGymWeb.ExerciseControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.ExercisesFixtures

  alias VirtualGym.Exercises.Exercise

  @create_attrs %{
    affected_muscles: ["option1", "option2"],
    name: "some name",
    recomendations: "some recomendations",
    video: "some video"
  }
  @update_attrs %{
    affected_muscles: ["option1"],
    name: "some updated name",
    recomendations: "some updated recomendations",
    video: "some updated video"
  }
  @invalid_attrs %{affected_muscles: nil, name: nil, recomendations: nil, video: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exercises", %{conn: conn} do
      conn = get(conn, ~p"/api/exercises")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exercise" do
    test "renders exercise when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/exercises", exercise: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/exercises/#{id}")

      assert %{
               "id" => ^id,
               "affected_muscles" => ["option1", "option2"],
               "name" => "some name",
               "recomendations" => "some recomendations",
               "video" => "some video"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/exercises", exercise: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exercise" do
    setup [:create_exercise]

    test "renders exercise when data is valid", %{
      conn: conn,
      exercise: %Exercise{id: id} = exercise
    } do
      conn = put(conn, ~p"/api/exercises/#{exercise}", exercise: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/exercises/#{id}")

      assert %{
               "id" => ^id,
               "affected_muscles" => ["option1"],
               "name" => "some updated name",
               "recomendations" => "some updated recomendations",
               "video" => "some updated video"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exercise: exercise} do
      conn = put(conn, ~p"/api/exercises/#{exercise}", exercise: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exercise" do
    setup [:create_exercise]

    test "deletes chosen exercise", %{conn: conn, exercise: exercise} do
      conn = delete(conn, ~p"/api/exercises/#{exercise}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/exercises/#{exercise}")
      end
    end
  end

  defp create_exercise(_) do
    exercise = exercise_fixture()
    %{exercise: exercise}
  end
end
