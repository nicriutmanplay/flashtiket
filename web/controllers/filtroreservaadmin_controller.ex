defmodule Flashtiket.FiltroreservaadminController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Reserva

    def reservas(conn, _) do
        reserva = Repo.all(Reserva)
        render conn, "index.html", reserva: reserva
    end

end