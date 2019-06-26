defmodule Flashtiket.FiltroreservaclienteController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Reserva

    def activas(conn, _) do
        cc = conn.assigns.current_user.cc
        query = from u in Reserva,
          where: u.ccCliente == ^cc,
          select: %{idPlanilla: u.idPlanilla, cantidad: u.cantidad}
        reserva = Repo.all(query)
        render conn, "index.html", reserva: reserva
    end

end