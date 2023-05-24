defmodule VirtualGymWeb.ExerciseJSON do
  alias VirtualGym.Exercises.Exercise

  @doc """
  Renders a list of exercises.
  """
  def index(%{exercises: exercises}) do
    %{data: for(exercise <- exercises, do: data(exercise))}
  end

  @doc """
  Renders a single exercise.
  """
  def show(%{exercise: exercise}) do
    %{data: data(exercise)}
  end

  defp data(%Exercise{} = exercise) do
    %{
      id: exercise.id,
      name: exercise.name,
      affected_muscles: exercise.affected_muscles,
      video: exercise.video,
      recomendations: exercise.recomendations
    }
  end
end
