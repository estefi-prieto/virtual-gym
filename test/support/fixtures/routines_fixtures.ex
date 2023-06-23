defmodule VirtualGym.RoutinesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Routines` context.
  """

  @doc """
  Generate a routine.
  """
  def routine_fixture(attrs \\ %{}) do
    {:ok, routine} =
      attrs
      |> Enum.into(%{
        date: "some date",
        suggested_date: "some suggested_date"
      })
      |> VirtualGym.Routines.create_routine()

    routine
  end
end
