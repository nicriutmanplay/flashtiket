defmodule Flashtiket.FiltroplanillaclienteController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla  

    def activas(conn, _) do
        estados = "activa"
        query = from u in Planilla,
          where: u.estado == ^estados,
          select: %{fecha: u.fecha, hora: u.hora, codigo: u.codigo, bus: u.bus, conductor: u.conductor}
        planilla = Repo.all(query)
        render conn, "index.html", planilla: planilla
    end

end