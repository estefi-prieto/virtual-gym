defmodule VirtualGymWeb.IterationController do
  use VirtualGymWeb, :controller

  alias VirtualGym.Iterations
  alias VirtualGym.Iterations.Iteration

  action_fallback VirtualGymWeb.FallbackController

  def index(conn, _params) do
    iterations = Iterations.list_iterations()
    render(conn, :index, iterations: iterations)
  end

  def create(conn, %{"iteration" => iteration_params}) do
    with {:ok, %Iteration{} = iteration} <- Iterations.create_iteration(iteration_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/iterations/#{iteration}")
      |> render(:show, iteration: iteration)
    end
  end

  def show(conn, %{"id" => id}) do
    iteration = Iterations.get_iteration!(id)
    render(conn, :show, iteration: iteration)
  end

  def update(conn, %{"id" => id, "iteration" => iteration_params}) do
    iteration = Iterations.get_iteration!(id)

    with {:ok, %Iteration{} = iteration} <- Iterations.update_iteration(iteration, iteration_params) do
      render(conn, :show, iteration: iteration)
    end
  end

  def delete(conn, %{"id" => id}) do
    iteration = Iterations.get_iteration!(id)

    with {:ok, %Iteration{id: id, order: order}} <- Iterations.delete_iteration(iteration) do
      json(conn, %{id: id, order: order})
    end
  end
end
