defmodule VirtualGym.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :note, :string
      add :status, :string
      add :iterations, references(:iterations, on_delete: :nothing, type: :binary_id)
      add :exercise_id, references(:exercises, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:series, [:iterations])
    create index(:series, [:exercise_id])
  end
end
