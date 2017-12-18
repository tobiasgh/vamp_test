defmodule VampTest.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :content, :string
      add :name, :string
      add :tag_type, :string

      timestamps()
    end

  end
end
