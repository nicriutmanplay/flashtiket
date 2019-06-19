defmodule Flashtiket.PlanillaController do
    use Flashtiket.Web, :controller
    alias Flashtiket.Planilla

    def create(conn, %{"planilla" => planilla_params}) do
        changeset = Planilla.changeset(planilla_params)
        case Repo.insert(changeset) do
            {:ok, planlla} ->
                conn
                |> put_flash(:info, "creada!")
                |> redirect(to: user_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

end