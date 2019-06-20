defmodule Flashtiket.UserController do
    use Flashtiket.Web, :controller
    plug :authenticate when action in [:index, :show]
    alias Flashtiket.User

    def create(conn, %{"user" => user_params}) do
        changeset = User.registration_changeset(%User{}, user_params)
        case Repo.insert(changeset) do
            {:ok, user} ->  
                if(user.rol == "admin") do
                    conn
                |> Flashtiket.Auth.login(user)
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: admin_path(conn, :index))
                else
                    conn
                |> Flashtiket.Auth.login(user)
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: cliente_path(conn, :index))
                end                             
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

    def new(conn, _params) do
        changeset = User.changeset(%User{})
        render conn, "new.html", changeset: changeset
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

end