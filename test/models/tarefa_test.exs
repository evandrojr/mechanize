defmodule Mechanize.TarefaTest do
  use Mechanize.ModelCase

  alias Mechanize.Tarefa

  @valid_attrs %{titulo: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tarefa.changeset(%Tarefa{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tarefa.changeset(%Tarefa{}, @invalid_attrs)
    refute changeset.valid?
  end
end
