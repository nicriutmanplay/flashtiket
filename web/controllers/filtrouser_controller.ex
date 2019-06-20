defmodule Flashtiket.FiltrouserController do
    use Flashtiket.Web, :controller
    alias Flashtiket.User  

    def filtro(conn, _) do
        render conn, "filtrouser.html"
    end

    def index(conn, %{"cc" => %{"cc" => cedula}}) do
        prueva = Repo.all(User)
        IO.inspect(prueva)
        query = from u in User,
          where: u.cc == ^cedula,
          select: %{name: u.name, surname: u.surname, cc: u.cc, telefono: u.telefono, rol: u.rol, correo: u.correo, username: u.username}
        user = Repo.one(query)
        IO.inspect(user)
        render conn, "index.html", user: user
    end 

end