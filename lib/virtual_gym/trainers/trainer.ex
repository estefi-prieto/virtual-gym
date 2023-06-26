defmodule VirtualGym.Trainers.Trainer do
  @moduledoc """
    This is the Model, here define struct and validations of a Trainer.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "trainers" do
    belongs_to :user, VirtualGym.Users.User

    timestamps()
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:user_id])
    |> validate_required([])
  end
end
