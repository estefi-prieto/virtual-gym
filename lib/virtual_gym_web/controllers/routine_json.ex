defmodule VirtualGymWeb.RoutineJSON do
  alias VirtualGym.Routines.Routine

  @doc """
  Renders a list of routines.
  """
  def index(%{routines: routines}) do
    %{data: for(routine <- routines, do: data(routine))}
  end

  @doc """
  Renders a single routine.
  """
  def show(%{routine: routine}) do
    %{data: data(routine)}
  end

  defp data(%Routine{} = routine) do
    %{
      id: routine.id,
      date: routine.date,
      suggested_date: routine.suggested_date
    }
  end
end
