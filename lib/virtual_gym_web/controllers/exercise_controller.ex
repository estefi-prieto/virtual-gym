defmodule VirtualGymWeb.ExerciseController do
  use VirtualGymWeb, :controller

  alias OpenApiSpex.Operation
  alias VirtualGym.Exercises
  alias VirtualGym.Exercises.Exercise

  alias VirtualGymWeb.ExerciseSchemas.{
    DeleteExerciseResponse,
    ExerciseIndexResponse,
    ExerciseRequest,
    ExerciseResponse
  }

  action_fallback VirtualGymWeb.FallbackController

  @spec open_api_operation(any) :: Operation.t()
  def open_api_operation(action) do
    operation = String.to_existing_atom("#{action}_operation")
    apply(__MODULE__, operation, [])
  end

  @spec index_operation() :: Operation.t()
  def index_operation do
    %Operation{
      tags: ["exercises"],
      summary: "List Exercises",
      description: "List an Exercises list",
      operationId: "ExerciseController.index",
      parameters: [],
      responses: %{
        200 => Operation.response("Exercise", "application/json", ExerciseIndexResponse)
      }
    }
  end

  def index(conn, _params) do
    exercises = Exercises.list_exercises()
    render(conn, :index, exercises: exercises)
  end

  @spec create_operation() :: Operation.t()
  def create_operation do
    %Operation{
      tags: ["exercises"],
      summary: "Create Exercises",
      description: "Create an Exercise",
      operationId: "ExerciseController.create",
      parameters: [],
      requestBody: Operation.request_body("Create Exercise", "application/json", ExerciseRequest),
      responses: %{
        201 => Operation.response("Exercise", "application/json", ExerciseResponse)
      }
    }
  end

  def create(conn, %{"exercise" => exercise_params}) do
    with {:ok, %Exercise{} = exercise} <- Exercises.create_exercise(exercise_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/exercises/#{exercise}")
      |> render(:show, exercise: exercise)
    end
  end

  @spec show_operation() :: Operation.t()
  def show_operation do
    %Operation{
      tags: ["exercises"],
      summary: "Show Exercises",
      description: "Show an Exercise",
      operationId: "ExerciseController.show",
      parameters: [
        Operation.parameter(:id, :path, :string, "Excercise ID")
      ],
      responses: %{
        200 => Operation.response("Exercise", "application/json", ExerciseResponse)
      }
    }
  end

  def show(conn, %{"id" => id}) do
    exercise = Exercises.get_exercise!(id)
    render(conn, :show, exercise: exercise)
  end

  @spec update_operation() :: Operation.t()
  def update_operation do
    %Operation{
      tags: ["exercises"],
      summary: "Update Exercises",
      description: "Update an Exercise",
      operationId: "ExerciseController.update",
      parameters: [
        Operation.parameter(:id, :path, :string, "Excercise ID")
      ],
      requestBody: Operation.request_body("Update Exercise", "application/json", ExerciseRequest),
      responses: %{
        200 => Operation.response("Exercise", "application/json", ExerciseResponse)
      }
    }
  end

  def update(conn, %{"id" => id, "exercise" => exercise_params}) do
    exercise = Exercises.get_exercise!(id)

    with {:ok, %Exercise{} = exercise} <- Exercises.update_exercise(exercise, exercise_params) do
      render(conn, :show, exercise: exercise)
    end
  end

  @spec delete_operation() :: Operation.t()
  def delete_operation do
    %Operation{
      tags: ["exercises"],
      summary: "Delete Exercises",
      description: "Delete an Exercise",
      operationId: "ExerciseController.delete",
      parameters: [
        Operation.parameter(:id, :path, :string, "Excercise ID")
      ],
      responses: %{
        200 => Operation.response("Exercise", "application/json", DeleteExerciseResponse)
      }
    }
  end

  def delete(conn, %{"id" => id}) do
    exercise = Exercises.get_exercise!(id)

    with {:ok, %Exercise{id: id, name: name}} <- Exercises.delete_exercise(exercise) do
      json(conn, %{id: id, name: name})
    end
  end
end
