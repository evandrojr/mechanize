defmodule Mechanize.Repo.Migrations.CreateTarefa do
  use Ecto.Migration

  def change do
    create table(:tarefas) do
      add :titulo, :string
      add :url, :string

      timestamps
    end

  end
end
