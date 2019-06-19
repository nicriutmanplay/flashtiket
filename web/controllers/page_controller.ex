defmodule Flashtiket.PageController do
  use Flashtiket.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  #def admin(conn, _params) do
   # render conn, "admin.html"
  #end

  #def cliente(conn, _params) do
   # render conn, "cliente.html"
  #end

end
