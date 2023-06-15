defmodule VirtualGym.SuperSeriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.SuperSeries` context.
  """

  @doc """
  Generate a super_serie.
  """
  def super_serie_fixture(attrs \\ %{}) do
    {:ok, super_serie} =
      attrs
      |> Enum.into(%{})
      |> VirtualGym.SuperSeries.create_super_serie()

    super_serie
  end
end
