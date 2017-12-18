defmodule VampTest.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias VampTest.Tag

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "tags" do
    field :content, :string
    field :name, :string
    field :tag_type, :string

    has_many :taggables, VampTest.Taggable
    has_many :users, through: [:taggables, :user]

    timestamps()
  end

  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:id, :content, :name, :tag_type])
    |> validate_required([:id, :content, :name, :tag_type])
  end
end
