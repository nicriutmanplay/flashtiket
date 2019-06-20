defmodule Flashtiket.PlanillaController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla    

    def filtro(conn, _) do
        render conn, "filtro.html"
    end

    def new(conn, _params) do
        changeset = Planilla.changeset(%Planilla{})
        render conn, "new.html", changeset: changeset
    end

    def index(conn, %{"fecha" => %{"fecha" => fechas}}) do
        query = from u in Planilla,
          where: u.fecha == ^fechas,
          select: %{fecha: u.fecha, hora: u.hora, codigo: u.codigo, bus: u.bus, conductor: u.conductor}
        planilla = Repo.all(query)
        render conn, "index.html", planilla: planilla
    end 

    def create(conn, %{"planilla" => planilla_params}) do
        changeset = Planilla.changeset(%Planilla{}, planilla_params)
        case Repo.insert(changeset) do
            {:ok, planilla} ->
                conn
                |> put_flash(:info, "creada!")
                |> redirect(to: admin_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end           

end
    