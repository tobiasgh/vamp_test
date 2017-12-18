# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VampTest.Repo.insert!(%VampTest.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule VampTest.Seeds do
  alias VampTest.User
  alias VampTest.Tag
  alias VampTest.Taggable
  alias VampTest.Repo
  alias Ecto.Changeset

  def users_insert(csv_path) do
    Repo.delete_all(User)
    File.stream!(Path.expand(csv_path))
    |> CSV.decode(headers: [:id, :full_name, :country, :inserted_at, :updated_at])
    |> Stream.each(fn row ->
      changeset = User.changeset(%User{}, row)
      user = Repo.insert!(changeset)
    end)
    |> Stream.run
  end

  def tags_insert(csv_path) do
    Repo.delete_all(Tag)
    File.stream!(Path.expand(csv_path))
    |> CSV.decode(headers: [:id, :name, :content, :tag_type, :inserted_at, :updated_at])
    |> Stream.each(fn row ->
      changeset = Tag.changeset(%Tag{}, row)
      Repo.insert!(changeset)
    end)
    |> Stream.run
  end

  def taggables_insert(csv_path) do
    File.stream!(Path.expand(csv_path))
    |> CSV.decode(headers: [:id, :user_id, :tag_id, :inserted_at, :updated_at])
    |> Stream.each(fn row ->
      changeset = Taggable.changeset(%Taggable{}, row)
      taggable = Repo.insert!(changeset)
    end)
    |> Stream.run
  end
end

VampTest.Seeds.users_insert("priv/repo/data/users.csv")
VampTest.Seeds.tags_insert("priv/repo/data/tags.csv")
VampTest.Seeds.taggables_insert("priv/repo/data/taggables.csv")