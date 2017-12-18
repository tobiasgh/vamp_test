defmodule VampTest.Taggable do
  use Ecto.Schema
  import Ecto.Changeset
  alias VampTest.Taggable

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "taggables" do
    belongs_to :user, VampTest.User, foreign_key: :user_id, type: :binary_id
    belongs_to :tag, VampTest.Tag, foreign_key: :tag_id, type: :binary_id

    timestamps()
  end

  def changeset(%Taggable{} = taggable, attrs) do
    taggable
    |> cast(attrs, [:id, :user_id, :tag_id])
    |> validate_required([:id, :user_id, :tag_id])
  end
end
