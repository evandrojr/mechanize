defmodule Mechanize.TarefaApiController do
  use Mechanize.Web, :controller
  # alias Mechanize.Repo
  alias Mechanize.Tarefa

  plug :action

  def index(conn, _params) do
    tarefas = Repo.all(Tarefa)
    render(conn, tarefas: tarefas)
  end
end
