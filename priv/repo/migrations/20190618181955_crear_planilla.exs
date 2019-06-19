defmodule Flashtiket.Repo.Migrations.CrearPlanilla do
  use Ecto.Migration

  def change do
    create table(:planilla) do
    add :fecha, :string
    add :hora, :string
    add :codigo, :string
    add :bus, :string
    add :condutor, :string
   
    timestamps
    end

  create unique_index(:planilla, [:fecha, :hora, :codigo])
  
  end
end
