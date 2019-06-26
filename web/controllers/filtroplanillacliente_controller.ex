defmodule Flashtiket.FiltroplanillaclienteController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla  
    alias Flashtiket.Reserva

    def activas(conn, _) do
        estados = "activa"
        query = from u in Planilla,
          where: u.estado == ^estados,
          select: %{id: u.id, fecha: u.fecha, hora: u.hora, codigo: u.codigo, bus: u.bus, conductor: u.conductor}
        planilla = Repo.all(query)
        render conn, "index.html", planilla: planilla
    end

    def reserva(conn, %{"reservas" => %{"cantidad" => cantidad, "id" => idPlanilla}}) do
        case Repo.insert %Reserva{idPlanilla: idPlanilla, ccCliente: conn.assigns.current_user.cc, cantidad: cantidad} do
            {:ok, reserva} ->
                conn
                |> put_flash(:info, "creada!")
                |> redirect(to: cliente_path(conn, :index))
            {:error, changeset} ->
                render(conn, "index.html", changeset: changeset)
        end
    end

end