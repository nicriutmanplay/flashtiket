defmodule Flashtiket.Planilla do
    use Flashtiket.Web, :model
    
        schema "planilla" do
        field :fecha, :string
        field :hora, :string
        field :codigo, :string
        field :bus, :string
        field :conductor, :string
        field :estado, :string
    
        timestamps
        end

        def changeset(model, params \\ %{}) do
            model
            |> cast(params, ~w(fecha hora codigo bus conductor estado), [])
        end

end