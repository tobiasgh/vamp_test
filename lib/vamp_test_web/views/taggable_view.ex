defmodule VampTestWeb.TaggableView do
  use VampTestWeb, :view
  use JaSerializer.PhoenixView

  has_one :user,
    serializer: VampTestWeb.UserView,
    include: true,
    identifiers: :when_included

  has_one :tag,
    serializer: VampTestWeb.TagView,
    include: true,
    identifiers: :when_included

  def user(struct, conn) do
    case struct.user do
      %Ecto.Association.NotLoaded{} -> %VampTest.User{id: struct.user_id}
      other -> other
    end
  end

  def tag(struct, conn) do
    case struct.tag do
      %Ecto.Association.NotLoaded{} -> %VampTest.Tag{id: struct.tag_id}
      other -> other
    end
  end
end
