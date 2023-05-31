defmodule VirtualGym.Repo.Migrations.CreateIterations do
  use Ecto.Migration

  def change do
    create table(:iterations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :rounds, :integer
      add :repetitions, :integer
      add :weight, :string
      add :order, :integer
      add :pause, :integer
      add :isometric_time, :integer
      add :concentric_time, :integer
      add :eccentric_time, :integer

      timestamps()
    end
  end
end
