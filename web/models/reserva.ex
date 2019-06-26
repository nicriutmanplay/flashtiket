defmodule Flashtiket.Reserva do
    use Flashtiket.Web, :model
    
        schema "reservas" do
        field :idPlanilla, :string
        field :ccCliente, :string
        field :cantidad, :string
    
        timestamps
        end

end