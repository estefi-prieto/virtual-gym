defmodule VirtualGym.Repo.Migrations.AddSuperSerieToSerie do
  use Ecto.Migration

  def change do
    alter table(:series) do
      add :super_serie_id, references(:super_series, on_delete: :nothing, type: :binary_id)
    end

    create index(:series, [:super_serie_id])
  end
end
