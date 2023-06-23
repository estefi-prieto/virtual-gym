defmodule VirtualGymWeb.SuperSerieJSON do
  alias VirtualGym.SuperSeries.SuperSerie

  @doc """
  Renders a list of super_series.
  """
  def index(%{super_series: super_series}) do
    %{data: for(super_serie <- super_series, do: data(super_serie))}
  end

  @doc """
  Renders a single super_serie.
  """
  def show(%{super_serie: super_serie}) do
    %{data: data(super_serie)}
  end

  defp data(%SuperSerie{} = super_serie) do
    %{
      id: super_serie.id,
      activity_id: super_serie.activity_id
    }
  end
end
