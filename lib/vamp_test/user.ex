defmodule VampTest.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias VampTest.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "users" do
    field :country, :string
    field :full_name, :string

    has_many :taggables, VampTest.Taggable, on_delete: :delete_all, on_replace: :delete
    has_many :tags, through: [:taggables, :tag]

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:id, :full_name, :country])
    |> validate_required([:id, :full_name, :country])
  end
end
