defmodule VampTest.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :full_name, :string
      add :country, :string

      timestamps()
    end

  end
end
