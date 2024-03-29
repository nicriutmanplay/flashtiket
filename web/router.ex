defmodule Flashtiket.Router do
  use Flashtiket.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Flashtiket.Auth, repo: Flashtiket.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Flashtiket do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/admins", AdminController, :index
    get "/clientes", ClienteController, :index
    resources "/planillas", PlanillaController, only: [:new, :create, :index]
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Flashtiket do
  #   pipe_through :api
  # end
end
