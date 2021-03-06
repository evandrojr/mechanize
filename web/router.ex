defmodule Mechanize.Router do
  use Mechanize.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mechanize do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
    get "/", TarefaController, :index
    resources "/tarefas", TarefaController
  end

  # Other scopes may use custom stacks.
  scope "/api", Mechanize do
    pipe_through :api
    resources "/tarefas", TarefaApiController
  end
end
