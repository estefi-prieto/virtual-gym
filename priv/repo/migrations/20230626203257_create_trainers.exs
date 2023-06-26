defmodule VirtualGym.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :binary_id, primary_key: true

      timestamps()
    end
  end
end
