defmodule VirtualGym.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :order, :integer
      add :rounds, :integer

      timestamps()
    end
  end
end
