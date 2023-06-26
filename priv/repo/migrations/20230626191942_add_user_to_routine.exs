defmodule VirtualGym.Repo.Migrations.AddUserToRoutine do
  use Ecto.Migration

  def change do
    alter table(:routines) do
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
    end
  end
end
