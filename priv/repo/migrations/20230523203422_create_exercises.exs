defmodule VirtualGym.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :affected_muscles, {:array, :string}
      add :video, :string
      add :recomendations, :string

      timestamps()
    end
  end
end
