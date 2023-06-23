defmodule VirtualGym.Repo.Migrations.AddActivityToSerie do
  use Ecto.Migration

  def change do
    alter table(:series) do
      add :activity_id, references(:activities, on_delete: :nothing, type: :binary_id)
    end

    create index(:series, [:activity_id])
  end
end
