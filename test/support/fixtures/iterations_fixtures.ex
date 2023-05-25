defmodule VirtualGym.IterationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Iterations` context.
  """

  @doc """
  Generate a iteration.
  """
  def iteration_fixture(attrs \\ %{}) do
    {:ok, iteration} =
      attrs
      |> Enum.into(%{
        concentric_time: 42,
        eccentric_time: 42,
        isometric_time: 42,
        order: 42,
        pause: 42,
        repetitions: 42,
        rounds: 42,
        weight: "some weight"
      })
      |> VirtualGym.Iterations.create_iteration()

    iteration
  end
end
