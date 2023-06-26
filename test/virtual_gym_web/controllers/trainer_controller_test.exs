defmodule VirtualGymWeb.TrainerControllerTest do
  use VirtualGymWeb.ConnCase

  import VirtualGym.TrainersFixtures

  alias VirtualGym.Trainers.Trainer

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trainers", %{conn: conn} do
      conn = get(conn, ~p"/api/trainers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trainer" do
    test "renders trainer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/trainers", trainer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/trainers/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/trainers", trainer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trainer" do
    setup [:create_trainer]

    test "renders trainer when data is valid", %{conn: conn, trainer: %Trainer{id: id} = trainer} do
      conn = put(conn, ~p"/api/trainers/#{trainer}", trainer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/trainers/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, trainer: trainer} do
      conn = put(conn, ~p"/api/trainers/#{trainer}", trainer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trainer" do
    setup [:create_trainer]

    test "deletes chosen trainer", %{conn: conn, trainer: trainer} do
      conn = delete(conn, ~p"/api/trainers/#{trainer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/trainers/#{trainer}")
      end
    end
  end

  defp create_trainer(_) do
    trainer = trainer_fixture()
    %{trainer: trainer}
  end
end
