defmodule VirtualGym.Series.Serie do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "series" do
    field :note, :string
    field :status, :string
    field :iterations, :binary_id
    field :exercise_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(serie, attrs) do
    serie
    |> cast(attrs, [:note, :status])
    |> validate_required([:note, :status])
  end
end
