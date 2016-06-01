defmodule Mechanize.TarefaController do
  use Mechanize.Web, :controller

  alias Mechanize.Tarefa

  plug :scrub_params, "tarefa" when action in [:create, :update]

  def index(conn, _params) do
    tarefas = Repo.all(Tarefa)
    render(conn, "index.html", tarefas: tarefas)
  end

  def new(conn, _params) do
    changeset = Tarefa.changeset(%Tarefa{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tarefa" => tarefa_params}) do
    changeset = Tarefa.changeset(%Tarefa{}, tarefa_params)

    case Repo.insert(changeset) do
      {:ok, _tarefa} ->
        conn
        |> put_flash(:info, "Tarefa created successfully.")
        |> redirect(to: tarefa_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tarefa = Repo.get!(Tarefa, id)
    render(conn, "show.html", tarefa: tarefa)
  end

  def edit(conn, %{"id" => id}) do
    tarefa = Repo.get!(Tarefa, id)
    changeset = Tarefa.changeset(tarefa)
    render(conn, "edit.html", tarefa: tarefa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tarefa" => tarefa_params}) do
    tarefa = Repo.get!(Tarefa, id)
    changeset = Tarefa.changeset(tarefa, tarefa_params)

    case Repo.update(changeset) do
      {:ok, tarefa} ->
        conn
        |> put_flash(:info, "Tarefa updated successfully.")
        |> redirect(to: tarefa_path(conn, :show, tarefa))
      {:error, changeset} ->
        render(conn, "edit.html", tarefa: tarefa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tarefa = Repo.get!(Tarefa, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tarefa)

    conn
    |> put_flash(:info, "Tarefa deleted successfully.")
    |> redirect(to: tarefa_path(conn, :index))
  end
end
