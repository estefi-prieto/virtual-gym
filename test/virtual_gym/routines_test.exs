defmodule VirtualGym.RoutinesTest do
  use VirtualGym.DataCase

  alias VirtualGym.Routines

  describe "routines" do
    alias VirtualGym.Routines.Routine

    import VirtualGym.RoutinesFixtures

    @invalid_attrs %{date: nil, suggested_date: nil}

    test "list_routines/0 returns all routines" do
      routine = routine_fixture()
      assert Routines.list_routines() == [routine]
    end

    test "get_routine!/1 returns the routine with given id" do
      routine = routine_fixture()
      assert Routines.get_routine!(routine.id) == routine
    end

    test "create_routine/1 with valid data creates a routine" do
      valid_attrs = %{date: "some date", suggested_date: "some suggested_date"}

      assert {:ok, %Routine{} = routine} = Routines.create_routine(valid_attrs)
      assert routine.date == "some date"
      assert routine.suggested_date == "some suggested_date"
    end

    test "create_routine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Routines.create_routine(@invalid_attrs)
    end

    test "update_routine/2 with valid data updates the routine" do
      routine = routine_fixture()
      update_attrs = %{date: "some updated date", suggested_date: "some updated suggested_date"}

      assert {:ok, %Routine{} = routine} = Routines.update_routine(routine, update_attrs)
      assert routine.date == "some updated date"
      assert routine.suggested_date == "some updated suggested_date"
    end

    test "update_routine/2 with invalid data returns error changeset" do
      routine = routine_fixture()
      assert {:error, %Ecto.Changeset{}} = Routines.update_routine(routine, @invalid_attrs)
      assert routine == Routines.get_routine!(routine.id)
    end

    test "delete_routine/1 deletes the routine" do
      routine = routine_fixture()
      assert {:ok, %Routine{}} = Routines.delete_routine(routine)
      assert_raise Ecto.NoResultsError, fn -> Routines.get_routine!(routine.id) end
    end

    test "change_routine/1 returns a routine changeset" do
      routine = routine_fixture()
      assert %Ecto.Changeset{} = Routines.change_routine(routine)
    end
  end
end
