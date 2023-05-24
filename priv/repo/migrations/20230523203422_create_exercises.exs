defmodule VirtualGym.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :affected_muscles, {:array, :string}
      add :video, :string
      add :recomendations, :string

      timestamps()
    end
  end
end
