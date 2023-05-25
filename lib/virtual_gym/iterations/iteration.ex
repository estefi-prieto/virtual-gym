defmodule VirtualGym.Iterations.Iteration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "iterations" do
    field :concentric_time, :integer
    field :eccentric_time, :integer
    field :isometric_time, :integer
    field :order, :integer
    field :pause, :integer
    field :repetitions, :integer
    field :rounds, :integer
    field :weight, :string
    field :exercise_id, :id

    timestamps()
  end

  @doc false
  def changeset(iteration, attrs) do
    iteration
    |> cast(attrs, [:rounds, :repetitions, :weight, :order, :pause, :isometric_time, :concentric_time, :eccentric_time])
    |> validate_required([:rounds, :order])
  end
end
