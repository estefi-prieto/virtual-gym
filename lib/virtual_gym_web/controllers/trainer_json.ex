defmodule VirtualGymWeb.TrainerJSON do
  alias VirtualGym.Trainers.Trainer

  @doc """
  Renders a list of trainers.
  """
  def index(%{trainers: trainers}) do
    %{data: for(trainer <- trainers, do: data(trainer))}
  end

  @doc """
  Renders a single trainer.
  """
  def show(%{trainer: trainer}) do
    %{data: data(trainer)}
  end

  defp data(%Trainer{} = trainer) do
    %{
      id: trainer.id,
      user_id: trainer.user_id
    }
  end
end
