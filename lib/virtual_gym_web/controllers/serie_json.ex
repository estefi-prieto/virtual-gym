defmodule VirtualGymWeb.SerieJSON do
  alias VirtualGym.Series.Serie

  @doc """
  Renders a list of series.
  """
  def index(%{series: series}) do
    %{data: for(serie <- series, do: data(serie))}
  end

  @doc """
  Renders a single serie.
  """
  def show(%{serie: serie}) do
    %{data: data(serie)}
  end

  defp data(%Serie{} = serie) do
    %{
      id: serie.id,
      note: serie.note,
      status: serie.status,
      exercise_id: serie.exercise_id,
      super_serie_id: serie.super_serie_id
    }
  end
end
