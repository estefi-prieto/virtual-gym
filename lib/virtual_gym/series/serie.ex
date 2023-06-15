defmodule VirtualGym.Series.Serie do
  @moduledoc """
    This is the Model, here define struct and validations of an Serie.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "series" do
    field :note, :string
    field :status, :string

    belongs_to :exercise, VirtualGym.Exercises.Exercise
    belongs_to :super_serie, VirtualGym.SuperSeries.SuperSerie
    has_many :iterations, VirtualGym.Iterations.Iteration

    timestamps()
  end

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:note, :status, :exercise_id, :super_serie_id])
    |> validate_required([:note, :status, :exercise_id])
  end
end
