defmodule VirtualGym.SeriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VirtualGym.Series` context.
  """

  @doc """
  Generate a serie.
  """
  def serie_fixture(attrs \\ %{}) do
    {:ok, serie} =
      attrs
      |> Enum.into(%{
        note: "some note",
        status: "some status"
      })
      |> VirtualGym.Series.create_serie()

    serie
  end
end
