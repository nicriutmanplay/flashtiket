defmodule Flashtiket.UserController do
    use Flashtiket.Web, :controller
    plug :authenticate when action in [:index, :show]
    alias Flashtiket.User

    def create(conn, %{"user" => user_params}) do
        changeset = User.registration_changeset(%User{}, user_params)
        case Repo.insert(changeset) do
            {:ok, user} ->
                conn
                |> Flashtiket.Auth.login(user)
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: user_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
    end

    def show(conn, %{"id" => id}) do
        user = Repo.get(Flashtiket.User, id)
        render conn, "show.html", user: user
    end

    defp authenticate(conn, _opts) do
        if conn.assigns.current_user do
            conn
        else
            conn
            |> put_flash(:error, "Debes iniciar sesión para acceder a esa página.")
            |> redirect(to: page_path(conn, :index))
            |> halt()
        end
    end

    def index(conn, _params) do
        users = Repo.all(Flashtiket.User)
        render conn, "index.html", users: users
    end    

end