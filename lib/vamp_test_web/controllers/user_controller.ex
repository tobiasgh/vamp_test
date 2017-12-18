defmodule VampTestWeb.UserController do
  use VampTestWeb, :controller

  alias VampTest.Repo

  def index(conn, _params) do
    users = Repo.all(VampTest.User) |> Repo.preload(taggables: :tag)

    render conn, "index.json-api", data: users
  end
end
