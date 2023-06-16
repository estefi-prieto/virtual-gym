defmodule VirtualGym.ActivitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Activities` context.
  """

  @doc """
  Generate a activity.
  """
  def activity_fixture(attrs \\ %{}) do
    {:ok, activity} =
      attrs
      |> Enum.into(%{
        order: 42,
        rounds: 42
      })
      |> VirtualGym.Activities.create_activity()

    activity
  end
end
