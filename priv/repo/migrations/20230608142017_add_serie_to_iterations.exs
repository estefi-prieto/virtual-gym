defmodule VirtualGym.Repo.Migrations.AddSerieToIterations do
  use Ecto.Migration

  def change do
    alter table(:iterations) do
      add :serie_id, references(:series, on_delete: :nothing, type: :binary_id)
    end

    create index(:iterations, [:serie_id])
  end
end
