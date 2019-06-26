defmodule Flashtiket.Repo.Migrations.CrearReserva do
  use Ecto.Migration

  def change do
    create table(:reservas) do
      add :idPlanilla, :string
      add :ccCliente, :string
      add :cantidad, :string
           
      timestamps
    end
  create unique_index(:reservas, [:idPlanilla, :ccCliente])
  
  end
end
