defmodule VirtualGymWeb.TrainerController do
  use VirtualGymWeb, :controller

  alias VirtualGym.Trainers
  alias VirtualGym.Trainers.Trainer

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    trainers = Trainers.list_trainers()
    render(conn, :index, trainers: trainers)
  end

  def create(conn, %{"trainer" => trainer_params}) do
    with {:ok, %Trainer{} = trainer} <- Trainers.create_trainer(trainer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/trainers/#{trainer}")
      |> render(:show, trainer: trainer)
    end
  end

  def show(conn, %{"id" => id}) do
    trainer = Trainers.get_trainer!(id)
    render(conn, :show, trainer: trainer)
  end

  def update(conn, %{"id" => id, "trainer" => trainer_params}) do
    trainer = Trainers.get_trainer!(id)

    with {:ok, %Trainer{} = trainer} <- Trainers.update_trainer(trainer, trainer_params) do
      render(conn, :show, trainer: trainer)
    end
  end

  def delete(conn, %{"id" => id}) do
    trainer = Trainers.get_trainer!(id)

    with {:ok, %Trainer{}} <- Trainers.delete_trainer(trainer) do
      send_resp(conn, :no_content, "")
    end
  end
end
