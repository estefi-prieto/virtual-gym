defmodule VirtualGymWeb.IterationControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.IterationsFixtures

  alias VirtualGym.Iterations.Iteration

  @create_attrs %{
    concentric_time: 42,
    eccentric_time: 42,
    isometric_time: 42,
    order: 42,
    pause: 42,
    repetitions: 42,
    rounds: 42,
    weight: "some weight"
  }
  @update_attrs %{
    concentric_time: 43,
    eccentric_time: 43,
    isometric_time: 43,
    order: 43,
    pause: 43,
    repetitions: 43,
    rounds: 43,
    weight: "some updated weight"
  }
  @invalid_attrs %{
    concentric_time: nil,
    eccentric_time: nil,
    isometric_time: nil,
    order: nil,
    pause: nil,
    repetitions: nil,
    rounds: nil,
    weight: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all iterations", %{conn: conn} do
      conn = get(conn, ~p"/api/iterations")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create iteration" do
    test "renders iteration when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/iterations", iteration: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/iterations/#{id}")

      assert %{
               "id" => ^id,
               "concentric_time" => 42,
               "eccentric_time" => 42,
               "isometric_time" => 42,
               "order" => 42,
               "pause" => 42,
               "repetitions" => 42,
               "rounds" => 42,
               "weight" => "some weight"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/iterations", iteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update iteration" do
    setup [:create_iteration]

    test "renders iteration when data is valid", %{
      conn: conn,
      iteration: %Iteration{id: id} = iteration
    } do
      conn = put(conn, ~p"/api/iterations/#{iteration}", iteration: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/iterations/#{id}")

      assert %{
               "id" => ^id,
               "concentric_time" => 43,
               "eccentric_time" => 43,
               "isometric_time" => 43,
               "order" => 43,
               "pause" => 43,
               "repetitions" => 43,
               "rounds" => 43,
               "weight" => "some updated weight"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, iteration: iteration} do
      conn = put(conn, ~p"/api/iterations/#{iteration}", iteration: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete iteration" do
    setup [:create_iteration]

    test "deletes chosen iteration", %{conn: conn, iteration: iteration} do
      conn = delete(conn, ~p"/api/iterations/#{iteration}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/iterations/#{iteration}")
      end
    end
  end

  defp create_iteration(_) do
    iteration = iteration_fixture()
    %{iteration: iteration}
  end
end
