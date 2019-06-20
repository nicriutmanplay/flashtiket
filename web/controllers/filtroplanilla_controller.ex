defmodule Flashtiket.FiltroplanillaController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla  

    def filtro(conn, _) do
        render conn, "filtroplanilla.html"
    end

    def index(conn, %{"fecha" => %{"fecha" => fechas}}) do
        query = from u in Planilla,
          where: u.fecha == ^fechas,
          select: %{fecha: u.fecha, hora: u.hora, codigo: u.codigo, bus: u.bus, conductor: u.conductor}
        planilla = Repo.all(query)
        render conn, "index.html", planilla: planilla
    end 

end