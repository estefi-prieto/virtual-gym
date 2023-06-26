defmodule VirtualGym.Repo.Migrations.AddUserToTrainer do
  use Ecto.Migration

  def change do
    alter table(:trainers) do
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
    end
  end
end
