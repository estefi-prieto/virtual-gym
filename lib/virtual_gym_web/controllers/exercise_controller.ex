defmodule VirtualGymWeb.ExerciseController do
  use VirtualGymWeb, :controller

  alias VirtualGym.Exercises
  alias VirtualGym.Exercises.Exercise

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    exercises = Exercises.list_exercises()
    render(conn, :index, exercises: exercises)
  end

  def create(conn, %{"exercise" => exercise_params}) do
    with {:ok, %Exercise{} = exercise} <- Exercises.create_exercise(exercise_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/exercises/#{exercise}")
      |> render(:show, exercise: exercise)
    end
  end

  def show(conn, %{"id" => id}) do
    exercise = Exercises.get_exercise!(id)
    render(conn, :show, exercise: exercise)
  end

  def update(conn, %{"id" => id, "exercise" => exercise_params}) do
    exercise = Exercises.get_exercise!(id)

    with {:ok, %Exercise{} = exercise} <- Exercises.update_exercise(exercise, exercise_params) do
      render(conn, :show, exercise: exercise)
    end
  end

  def delete(conn, %{"id" => id}) do
    exercise = Exercises.get_exercise!(id)

    with {:ok, %Exercise{id: id, name: name}} <- Exercises.delete_exercise(exercise) do
      json(conn, %{id: id, name: name})
    end
  end
end
