defmodule VirtualGym.Exercises.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :affected_muscles, {:array, :string}
    field :name, :string
    field :recomendations, :string
    field :video, :string

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :affected_muscles, :video, :recomendations])
    |> validate_required([:name, :affected_muscles])
  end
end
