defmodule VirtualGym.Repo.Migrations.AddActivityToSuperSerie do
  use Ecto.Migration

  def change do
    alter table(:super_series) do
      add :activity_id, references(:activities, on_delete: :nothing, type: :binary_id)
    end

    create index(:super_series, [:activity_id])
  end
end
