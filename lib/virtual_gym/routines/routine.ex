defmodule VirtualGym.Routines.Routine do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "routines" do
    field :date, :string
    field :suggested_date, :string

    has_many :activities, VirtualGym.Activities.Activity

    timestamps()
  end

  @doc false
  def changeset(routine, attrs) do
    routine
    |> cast(attrs, [:date, :suggested_date])
    |> validate_required([:date, :suggested_date])
  end
end
