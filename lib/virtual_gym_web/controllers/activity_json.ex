defmodule VirtualGymWeb.ActivityJSON do
  alias VirtualGym.Activities.Activity

  @doc """
  Renders a list of activities.
  """
  def index(%{activities: activities}) do
    %{data: for(activity <- activities, do: data(activity))}
  end

  @doc """
  Renders a single activity.
  """
  def show(%{activity: activity}) do
    %{data: data(activity)}
  end

  defp data(%Activity{} = activity) do
    %{
      id: activity.id,
      order: activity.order,
      rounds: activity.rounds
    }
  end
end
