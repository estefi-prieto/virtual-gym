defmodule VirtualGym.Repo.Migrations.CreateSuperSeries do
  use Ecto.Migration

  def change do
    create table(:super_series, primary_key: false) do
      add :id, :binary_id, primary_key: true

      timestamps()
    end
  end
end
