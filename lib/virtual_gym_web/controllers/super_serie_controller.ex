defmodule VirtualGymWeb.SuperSerieController do
  use VirtualGymWeb, :controller

  alias VirtualGym.SuperSeries
  alias VirtualGym.SuperSeries.SuperSerie

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    super_series = SuperSeries.list_super_series()
    render(conn, :index, super_series: super_series)
  end

  def create(conn, %{"super_serie" => super_serie_params}) do
    with {:ok, %SuperSerie{} = super_serie} <- SuperSeries.create_super_serie(super_serie_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/super_series/#{super_serie}")
      |> render(:show, super_serie: super_serie)
    end
  end

  def show(conn, %{"id" => id}) do
    super_serie = SuperSeries.get_super_serie!(id)
    render(conn, :show, super_serie: super_serie)
  end

  def update(conn, %{"id" => id, "super_serie" => super_serie_params}) do
    super_serie = SuperSeries.get_super_serie!(id)

    with {:ok, %SuperSerie{} = super_serie} <- SuperSeries.update_super_serie(super_serie, super_serie_params) do
      render(conn, :show, super_serie: super_serie)
    end
  end

  def delete(conn, %{"id" => id}) do
    super_serie = SuperSeries.get_super_serie!(id)

    with {:ok, %SuperSerie{}} <- SuperSeries.delete_super_serie(super_serie) do
      send_resp(conn, :no_content, "")
    end
  end
end
