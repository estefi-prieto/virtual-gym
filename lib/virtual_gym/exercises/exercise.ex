defmodule VirtualGym.Exercises.Exercise do
  @moduledoc """
    This is the Model, here define struct and validations of an Exercise
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "exercises" do
    field :affected_muscles, {:array, :string}
    field :name, :string
    field :recomendations, :string
    field :video, :string

    has_many :series, VirtualGym.Series.Serie

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :affected_muscles, :video, :recomendations])
    |> validate_required([:name, :affected_muscles])
  end
end
