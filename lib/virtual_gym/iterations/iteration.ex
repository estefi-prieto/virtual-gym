defmodule VirtualGym.Iterations.Iteration do
  @moduledoc """
    This is the Model, here define struct and validations of an Iteration
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "iterations" do
    field :concentric_time, :integer
    field :eccentric_time, :integer
    field :isometric_time, :integer
    field :order, :integer
    field :pause, :integer
    field :repetitions, :integer
    field :rounds, :integer
    field :weight, :string

    belongs_to :serie, VirtualGym.Series.Serie

    timestamps()
  end

  @doc false
  def changeset(iteration, attrs) do
    iteration
    |> cast(attrs, [
      :rounds,
      :repetitions,
      :weight,
      :order,
      :pause,
      :isometric_time,
      :concentric_time,
      :eccentric_time,
      :serie_id
    ])
    |> validate_required([:rounds, :order])
  end
end
