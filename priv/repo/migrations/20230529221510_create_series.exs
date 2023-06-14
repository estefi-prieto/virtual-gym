defmodule VirtualGym.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :note, :string
      add :status, :string
      add :exercise_id, references(:exercises, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end
  end
end
