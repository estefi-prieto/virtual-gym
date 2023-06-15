defmodule VirtualGym.SuperSeries do
  @moduledoc """
  The SuperSeries context.
  """

  import Ecto.Query, warn: false
  alias VirtualGym.Repo

  alias VirtualGym.SuperSeries.SuperSerie

  @doc """
  Returns the list of super_series.

  ## Examples

      iex> list_super_series()
      [%SuperSerie{}, ...]

  """
  def list_super_series do
    Repo.all(SuperSerie)
  end

  @doc """
  Gets a single super_serie.

  Raises `Ecto.NoResultsError` if the Super serie does not exist.

  ## Examples

      iex> get_super_serie!(123)
      %SuperSerie{}

      iex> get_super_serie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_super_serie!(id), do: Repo.get!(SuperSerie, id)

  @doc """
  Creates a super_serie.

  ## Examples

      iex> create_super_serie(%{field: value})
      {:ok, %SuperSerie{}}

      iex> create_super_serie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_super_serie(attrs \\ %{}) do
    %SuperSerie{}
    |> SuperSerie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a super_serie.

  ## Examples

      iex> update_super_serie(super_serie, %{field: new_value})
      {:ok, %SuperSerie{}}

      iex> update_super_serie(super_serie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_super_serie(%SuperSerie{} = super_serie, attrs) do
    super_serie
    |> SuperSerie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a super_serie.

  ## Examples

      iex> delete_super_serie(super_serie)
      {:ok, %SuperSerie{}}

      iex> delete_super_serie(super_serie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_super_serie(%SuperSerie{} = super_serie) do
    Repo.delete(super_serie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking super_serie changes.

  ## Examples

      iex> change_super_serie(super_serie)
      %Ecto.Changeset{data: %SuperSerie{}}

  """
  def change_super_serie(%SuperSerie{} = super_serie, attrs \\ %{}) do
    SuperSerie.changeset(super_serie, attrs)
  end
end
