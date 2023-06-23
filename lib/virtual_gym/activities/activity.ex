defmodule VirtualGym.Activities.Activity do
  @moduledoc """
    This is the Model, here define struct and validations of an Activity.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "activities" do
    field :order, :integer
    field :rounds, :integer

    has_one :super_serie, VirtualGym.SuperSeries.SuperSerie

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:order, :rounds])
    |> validate_required([:order, :rounds])
  end
end
