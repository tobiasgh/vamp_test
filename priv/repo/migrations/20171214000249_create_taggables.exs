defmodule VampTest.Repo.Migrations.CreateTaggables do
  use Ecto.Migration

  def change do
    create table(:taggables, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all, type: :uuid)
      add :tag_id, references(:tags, on_delete: :delete_all, type: :uuid)

      timestamps()
    end

    create index(:taggables, [:user_id])
    create index(:taggables, [:tag_id])
  end
end
