defmodule Mechanize.TarefaControllerTest do
  use Mechanize.ConnCase

  alias Mechanize.Tarefa
  @valid_attrs %{titulo: "some content", url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tarefa_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing tarefas"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, tarefa_path(conn, :new)
    assert html_response(conn, 200) =~ "New tarefa"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, tarefa_path(conn, :create), tarefa: @valid_attrs
    assert redirected_to(conn) == tarefa_path(conn, :index)
    assert Repo.get_by(Tarefa, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tarefa_path(conn, :create), tarefa: @invalid_attrs
    assert html_response(conn, 200) =~ "New tarefa"
  end

  test "shows chosen resource", %{conn: conn} do
    tarefa = Repo.insert! %Tarefa{}
    conn = get conn, tarefa_path(conn, :show, tarefa)
    assert html_response(conn, 200) =~ "Show tarefa"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, tarefa_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    tarefa = Repo.insert! %Tarefa{}
    conn = get conn, tarefa_path(conn, :edit, tarefa)
    assert html_response(conn, 200) =~ "Edit tarefa"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    tarefa = Repo.insert! %Tarefa{}
    conn = put conn, tarefa_path(conn, :update, tarefa), tarefa: @valid_attrs
    assert redirected_to(conn) == tarefa_path(conn, :show, tarefa)
    assert Repo.get_by(Tarefa, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tarefa = Repo.insert! %Tarefa{}
    conn = put conn, tarefa_path(conn, :update, tarefa), tarefa: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit tarefa"
  end

  test "deletes chosen resource", %{conn: conn} do
    tarefa = Repo.insert! %Tarefa{}
    conn = delete conn, tarefa_path(conn, :delete, tarefa)
    assert redirected_to(conn) == tarefa_path(conn, :index)
    refute Repo.get(Tarefa, tarefa.id)
  end
end
