defmodule VirtualGym.SuperSeries.SuperSerie do
  @moduledoc """
    This is the Model, here define struct and validations of an Super Serie.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "super_series" do
    has_many :series, VirtualGym.Series.Serie

    timestamps()
  end

  @doc false
  def changeset(super_serie, attrs) do
    super_serie
    |> cast(attrs, [])
    |> validate_required([])
  end
end
