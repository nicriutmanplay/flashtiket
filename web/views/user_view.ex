defmodule Flashtiket.UserView do
use Flashtiket.Web, :view
alias Flashtiket.User

    def name(%User{name: name}) do     
        name
        |> String.split(" ")
        |> Enum.at(0)
    end

    def surname(%User{surname: surname}) do        
        surname
        |> String.split(" ")
        |> Enum.at(0)
    end

    def cc(%User{cc: cc}) do        
        cc
        |> String.split(" ")
        |> Enum.at(0)
    end

    def telefono(%User{telefono: telefono}) do        
        telefono
        |> String.split(" ")
        |> Enum.at(0)
    end

    def rol(%User{rol: rol}) do        
        rol
        |> String.split(" ")
        |> Enum.at(0)
    end

    def correo(%User{correo: correo}) do        
        correo
        |> String.split(" ")
        |> Enum.at(0)
    end

    def username(%User{username: username}) do        
        username
        |> String.split(" ")
        |> Enum.at(0)
    end

end