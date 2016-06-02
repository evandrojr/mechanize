defmodule Mechanize.TarefaApiView do
  use Mechanize.Web, :view

  def render("index.json", %{tarefas: tarefas}) do
    tarefas
  end

end
