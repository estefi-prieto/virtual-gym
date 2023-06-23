defmodule VirtualGym.Repo.Migrations.AddRoutineToActivity do
  use Ecto.Migration

  def change do
    alter table(:activities) do
      add :routine_id, references(:routines, on_delete: :nothing, type: :binary_id)
    end
  end
end
