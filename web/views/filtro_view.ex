defmodule Flashtiket.FiltroView do
    use Flashtiket.Web, :view
    
    def fecha(%{fecha: fecha}) do
        fecha
        |> String.split(" ")
        |> Enum.at(0)
      end
  
      def hora(%{hora: hora}) do
      hora
        |> String.split(" ") 
        |> Enum.at(0)
      end
  
      def codigo(%{codigo: codigo}) do
      codigo
        |> String.split(" ")
        |> Enum.at(0)
      end
   
      def bus(%{bus: bus}) do
      bus
        |> String.split(" ")
        |> Enum.at(0)
      end
  
      def conductor(%{conductor: conductor})do
      conductor
        |> String.split(" ")
        |> Enum.at(0)
      end
end