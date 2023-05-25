defmodule VirtualGym.Repo.Migrations.CreateIterations do
  use Ecto.Migration

  def change do
    create table(:iterations) do
      add :rounds, :integer
      add :repetitions, :integer
      add :weight, :string
      add :order, :integer
      add :pause, :integer
      add :isometric_time, :integer
      add :concentric_time, :integer
      add :eccentric_time, :integer
      add :exercise_id, references(:exercises, on_delete: :nothing)

      timestamps()
    end

    create index(:iterations, [:exercise_id])
  end
end
