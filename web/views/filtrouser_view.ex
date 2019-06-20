defmodule Flashtiket.FiltrouserView do
    use Flashtiket.Web, :view

        def name(%{name: name}) do     
            name
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def surname(%{surname: surname}) do        
            surname
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def cc(%{cc: cc}) do        
            cc
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def telefono(%{telefono: telefono}) do        
            telefono
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def rol(%{rol: rol}) do        
            rol
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def correo(%{correo: correo}) do        
            correo
            |> String.split(" ")
            |> Enum.at(0)
        end
    
        def username(%{username: username}) do        
            username
            |> String.split(" ")
            |> Enum.at(0)
        end
    
end