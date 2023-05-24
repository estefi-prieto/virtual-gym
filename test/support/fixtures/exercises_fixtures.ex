defmodule VirtualGym.ExercisesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Exercises` context.
  """

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        affected_muscles: ["option1", "option2"],
        name: "some name",
        recomendations: "some recomendations",
        video: "some video"
      })
      |> VirtualGym.Exercises.create_exercise()

    exercise
  end
end
