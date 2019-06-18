defmodule Flashtiket.UserController do
    use Flashtiket.Web, :controller
    alias Flashtiket.User

    def create(conn, %{"user" => user_params}) do
        changeset = User.changeset(%User{}, user_params)
        {:ok, user} = Repo.insert(changeset)
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
    end

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
    end

    def index(conn, _params) do
        users = Repo.all(Flashtiket.User)
        render conn, "index.html", users: users
    end

    def show(conn, %{"id" => id}) do
        user = Repo.get(Flashtiket.User, id)
        render conn, "show.html", user: user
    end
end