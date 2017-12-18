defmodule VampTestWeb.UserView do
  use VampTestWeb, :view
  use JaSerializer.PhoenixView

  alias VampTest.Repo

  attributes [:full_name, :country]

  has_many :taggables,
    serializer: VampTestWeb.TaggableView,
    include: true,
    identifiers: :when_included

  def taggables(struct, conn) do
    case struct.taggables do
      %Ecto.Association.NotLoaded{} ->
        struct
        |> Ecto.assoc(:taggables)
        |> Repo.all
      other -> other
    end
  end
end
