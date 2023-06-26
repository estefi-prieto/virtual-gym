defmodule VirtualGym.TrainersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Trainers` context.
  """

  @doc """
  Generate a trainer.
  """
  def trainer_fixture(attrs \\ %{}) do
    {:ok, trainer} =
      attrs
      |> Enum.into(%{})
      |> VirtualGym.Trainers.create_trainer()

    trainer
  end
end
