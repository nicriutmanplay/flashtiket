defmodule Flashtiket.FiltroreservaadminView do
    use Flashtiket.Web, :view
    
    def id(%{idPlanilla: idPlanilla}) do
        idPlanilla
        |> String.split(" ")
        |> Enum.at(0)
      end

      def cc(%{ccCliente: ccCliente}) do
        ccCliente
        |> String.split(" ") 
        |> Enum.at(0)
      end
  
      def cantidad(%{cantidad: cantidad}) do
        cantidad
        |> String.split(" ") 
        |> Enum.at(0)
      end

end