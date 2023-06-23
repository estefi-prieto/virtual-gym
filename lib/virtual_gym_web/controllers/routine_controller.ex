defmodule VirtualGymWeb.RoutineController do
  use VirtualGymWeb, :controller

  alias VirtualGym.Routines
  alias VirtualGym.Routines.Routine

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    routines = Routines.list_routines()
    render(conn, :index, routines: routines)
  end

  def create(conn, %{"routine" => routine_params}) do
    with {:ok, %Routine{} = routine} <- Routines.create_routine(routine_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/routines/#{routine}")
      |> render(:show, routine: routine)
    end
  end

  def show(conn, %{"id" => id}) do
    routine = Routines.get_routine!(id)
    render(conn, :show, routine: routine)
  end

  def update(conn, %{"id" => id, "routine" => routine_params}) do
    routine = Routines.get_routine!(id)

    with {:ok, %Routine{} = routine} <- Routines.update_routine(routine, routine_params) do
      render(conn, :show, routine: routine)
    end
  end

  def delete(conn, %{"id" => id}) do
    routine = Routines.get_routine!(id)

    with {:ok, %Routine{id: id}} <- Routines.delete_routine(routine) do
      json(conn, %{id: id})
    end
  end
end
