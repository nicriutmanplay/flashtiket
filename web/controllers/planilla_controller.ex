defmodule Flashtiket.PlanillaController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla

    def new(conn, _params) do
        changeset = Planilla.changeset(%Planilla{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"planilla" => planilla_params}) do
        IO.inspect(planilla_params)
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

    def index(conn, _params) do
        planilla = Repo.all(Flashtiket.Planilla)
        render conn, "index.html", planilla: planilla
    end  

end