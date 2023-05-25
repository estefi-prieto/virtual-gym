defmodule VirtualGymWeb.IterationJSON do
  alias VirtualGym.Iterations.Iteration

  @doc """
  Renders a list of iterations.
  """
  def index(%{iterations: iterations}) do
    %{data: for(iteration <- iterations, do: data(iteration))}
  end

  @doc """
  Renders a single iteration.
  """
  def show(%{iteration: iteration}) do
    %{data: data(iteration)}
  end

  defp data(%Iteration{} = iteration) do
    %{
      id: iteration.id,
      rounds: iteration.rounds,
      repetitions: iteration.repetitions,
      weight: iteration.weight,
      order: iteration.order,
      pause: iteration.pause,
      isometric_time: iteration.isometric_time,
      concentric_time: iteration.concentric_time,
      eccentric_time: iteration.eccentric_time
    }
  end
end
