defmodule Project.Repo.Migrations.CreateTable070720211338 do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :eng, :string
      add :rus, :string
      # add :google_id, references(:googles)
    end
  end
end
