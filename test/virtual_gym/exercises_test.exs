defmodule VirtualGym.ExercisesTest do
  use VirtualGym.DataCase

  alias VirtualGym.Exercises

  describe "exercises" do
    alias VirtualGym.Exercises.Exercise

    import VirtualGym.ExercisesFixtures

    @invalid_attrs %{affected_muscles: nil, name: nil, recomendations: nil, video: nil}

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Exercises.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Exercises.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{
        affected_muscles: ["option1", "option2"],
        name: "some name",
        recomendations: "some recomendations",
        video: "some video"
      }

      assert {:ok, %Exercise{} = exercise} = Exercises.create_exercise(valid_attrs)
      assert exercise.affected_muscles == ["option1", "option2"]
      assert exercise.name == "some name"
      assert exercise.recomendations == "some recomendations"
      assert exercise.video == "some video"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Exercises.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()

      update_attrs = %{
        affected_muscles: ["option1"],
        name: "some updated name",
        recomendations: "some updated recomendations",
        video: "some updated video"
      }

      assert {:ok, %Exercise{} = exercise} = Exercises.update_exercise(exercise, update_attrs)
      assert exercise.affected_muscles == ["option1"]
      assert exercise.name == "some updated name"
      assert exercise.recomendations == "some updated recomendations"
      assert exercise.video == "some updated video"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Exercises.update_exercise(exercise, @invalid_attrs)
      assert exercise == Exercises.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Exercises.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Exercises.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Exercises.change_exercise(exercise)
    end
  end
end
