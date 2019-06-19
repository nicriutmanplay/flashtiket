defmodule Flashtiket.PlanillaView do
    use Flashtiket.Web, :view
    alias Flashtiket.Planilla

    def datos(%Planilla{fecha: fecha, hora: hora, codigo: codigo, bus: bus, conductor: conductor}) do
      fechas =
        fecha
        |> String.split(" ")
        |> Enum.at(0) 
      horas =
        hora
        |> String.split(" ")
        |> Enum.at(0) 
      codigos =
        codigo
        |> String.split(" ")
        |> Enum.at(0) 
      buses =
        bus
        |> String.split(" ")
        |> Enum.at(0) 
      conductores =
        conductor
        |> String.split(" ")
        |> Enum.at(0) 
       "#{fecha} #{horas} #{codigos} #{buses} #{conductores}"
    end
end
  