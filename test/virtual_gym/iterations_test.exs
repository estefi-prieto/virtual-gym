defmodule VirtualGym.IterationsTest do
  use VirtualGym.DataCase

  alias VirtualGym.Iterations

  describe "iterations" do
    alias VirtualGym.Iterations.Iteration

    import VirtualGym.IterationsFixtures

    @invalid_attrs %{concentric_time: nil, eccentric_time: nil, isometric_time: nil, order: nil, pause: nil, repetitions: nil, rounds: nil, weight: nil}

    test "list_iterations/0 returns all iterations" do
      iteration = iteration_fixture()
      assert Iterations.list_iterations() == [iteration]
    end

    test "get_iteration!/1 returns the iteration with given id" do
      iteration = iteration_fixture()
      assert Iterations.get_iteration!(iteration.id) == iteration
    end

    test "create_iteration/1 with valid data creates a iteration" do
      valid_attrs = %{concentric_time: 42, eccentric_time: 42, isometric_time: 42, order: 42, pause: 42, repetitions: 42, rounds: 42, weight: "some weight"}

      assert {:ok, %Iteration{} = iteration} = Iterations.create_iteration(valid_attrs)
      assert iteration.concentric_time == 42
      assert iteration.eccentric_time == 42
      assert iteration.isometric_time == 42
      assert iteration.order == 42
      assert iteration.pause == 42
      assert iteration.repetitions == 42
      assert iteration.rounds == 42
      assert iteration.weight == "some weight"
    end

    test "create_iteration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Iterations.create_iteration(@invalid_attrs)
    end

    test "update_iteration/2 with valid data updates the iteration" do
      iteration = iteration_fixture()
      update_attrs = %{concentric_time: 43, eccentric_time: 43, isometric_time: 43, order: 43, pause: 43, repetitions: 43, rounds: 43, weight: "some updated weight"}

      assert {:ok, %Iteration{} = iteration} = Iterations.update_iteration(iteration, update_attrs)
      assert iteration.concentric_time == 43
      assert iteration.eccentric_time == 43
      assert iteration.isometric_time == 43
      assert iteration.order == 43
      assert iteration.pause == 43
      assert iteration.repetitions == 43
      assert iteration.rounds == 43
      assert iteration.weight == "some updated weight"
    end

    test "update_iteration/2 with invalid data returns error changeset" do
      iteration = iteration_fixture()
      assert {:error, %Ecto.Changeset{}} = Iterations.update_iteration(iteration, @invalid_attrs)
      assert iteration == Iterations.get_iteration!(iteration.id)
    end

    test "delete_iteration/1 deletes the iteration" do
      iteration = iteration_fixture()
      assert {:ok, %Iteration{}} = Iterations.delete_iteration(iteration)
      assert_raise Ecto.NoResultsError, fn -> Iterations.get_iteration!(iteration.id) end
    end

    test "change_iteration/1 returns a iteration changeset" do
      iteration = iteration_fixture()
      assert %Ecto.Changeset{} = Iterations.change_iteration(iteration)
    end
  end
end
