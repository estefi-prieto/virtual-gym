defmodule VirtualGym.Repo.Migrations.CreateRoutines do
  use Ecto.Migration

  def change do
    create table(:routines, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :string
      add :suggested_date, :string

      timestamps()
    end
  end
end
