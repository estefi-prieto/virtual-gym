defmodule VirtualGymWeb.ActivityController do
  use VirtualGymWeb, :controller

  alias VirtualGym.Activities
  alias VirtualGym.Activities.Activity

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    activities = Activities.list_activities()
    render(conn, :index, activities: activities)
  end

  def create(conn, %{"activity" => activity_params}) do
    with {:ok, %Activity{} = activity} <- Activities.create_activity(activity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/activities/#{activity}")
      |> render(:show, activity: activity)
    end
  end

  def show(conn, %{"id" => id}) do
    activity = Activities.get_activity!(id)
    render(conn, :show, activity: activity)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Activities.get_activity!(id)

    with {:ok, %Activity{} = activity} <- Activities.update_activity(activity, activity_params) do
      render(conn, :show, activity: activity)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity = Activities.get_activity!(id)

    with {:ok, %Activity{id: id}} <- Activities.delete_activity(activity) do
      json(conn, %{id: id})
    end
  end
end
