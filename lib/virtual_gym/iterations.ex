defmodule VirtualGym.Iterations do
  @moduledoc """
  The Iterations context.
  """

  import Ecto.Query, warn: false
  alias VirtualGym.Repo

  alias VirtualGym.Iterations.Iteration

  @doc """
  Returns the list of iterations.

  ## Examples

      iex> list_iterations()
      [%Iteration{}, ...]

  """
  def list_iterations do
    Repo.all(Iteration)
  end

  @doc """
  Gets a single iteration.

  Raises `Ecto.NoResultsError` if the Iteration does not exist.

  ## Examples

      iex> get_iteration!(123)
      %Iteration{}

      iex> get_iteration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_iteration!(id), do: Repo.get!(Iteration, id)

  @doc """
  Creates a iteration.

  ## Examples

      iex> create_iteration(%{field: value})
      {:ok, %Iteration{}}

      iex> create_iteration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_iteration(attrs \\ %{}) do
    %Iteration{}
    |> Iteration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a iteration.

  ## Examples

      iex> update_iteration(iteration, %{field: new_value})
      {:ok, %Iteration{}}

      iex> update_iteration(iteration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_iteration(%Iteration{} = iteration, attrs) do
    iteration
    |> Iteration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a iteration.

  ## Examples

      iex> delete_iteration(iteration)
      {:ok, %Iteration{}}

      iex> delete_iteration(iteration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_iteration(%Iteration{} = iteration) do
    Repo.delete(iteration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking iteration changes.

  ## Examples

      iex> change_iteration(iteration)
      %Ecto.Changeset{data: %Iteration{}}

  """
  def change_iteration(%Iteration{} = iteration, attrs \\ %{}) do
    Iteration.changeset(iteration, attrs)
  end
end
