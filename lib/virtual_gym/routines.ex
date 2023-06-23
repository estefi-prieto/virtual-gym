defmodule VirtualGym.Routines do
  @moduledoc """
  The Routines context.
  """

  import Ecto.Query, warn: false
  alias VirtualGym.Repo

  alias VirtualGym.Routines.Routine

  @doc """
  Returns the list of routines.

  ## Examples

      iex> list_routines()
      [%Routine{}, ...]

  """
  def list_routines do
    Repo.all(Routine)
  end

  @doc """
  Gets a single routine.

  Raises `Ecto.NoResultsError` if the Routine does not exist.

  ## Examples

      iex> get_routine!(123)
      %Routine{}

      iex> get_routine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_routine!(id), do: Repo.get!(Routine, id)

  @doc """
  Creates a routine.

  ## Examples

      iex> create_routine(%{field: value})
      {:ok, %Routine{}}

      iex> create_routine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_routine(attrs \\ %{}) do
    %Routine{}
    |> Routine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a routine.

  ## Examples

      iex> update_routine(routine, %{field: new_value})
      {:ok, %Routine{}}

      iex> update_routine(routine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_routine(%Routine{} = routine, attrs) do
    routine
    |> Routine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a routine.

  ## Examples

      iex> delete_routine(routine)
      {:ok, %Routine{}}

      iex> delete_routine(routine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_routine(%Routine{} = routine) do
    Repo.delete(routine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking routine changes.

  ## Examples

      iex> change_routine(routine)
      %Ecto.Changeset{data: %Routine{}}

  """
  def change_routine(%Routine{} = routine, attrs \\ %{}) do
    Routine.changeset(routine, attrs)
  end
end
