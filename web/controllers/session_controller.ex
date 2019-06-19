defmodule Flashtiket.SessionController do
    use Flashtiket.Web, :controller

    def new(conn, _) do
        render conn, "new.html"
    end

    def create(conn, %{"session" => %{"username" => user, "password" =>
                                        pass}}) do
    case Flashtiket.Auth.login_by_username_and_pass(conn, user, pass, repo:
                                                Repo) do
        {:ok, conn} ->
            if(conn.assigns.current_user.rol == "admin") do
                conn
                |> put_flash(:info, "Welcome back!")
                |> redirect(to: admin_path(conn, :index))
            else
                conn
                |> put_flash(:info, "Welcome back!")
                |> redirect(to: cliente_path(conn, :index))
            end             
        {:error, _reason, conn} ->
            conn
            |> put_flash(:error, "Invalid username/password combination")
            |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> Flashtiket.Auth.logout()
        |> redirect(to: page_path(conn, :index))
    end
end