defmodule Flashtiket.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
    add :name, :string
    add :surname, :string
    add :cc, :string
    add :telefono, :string
    add :rol, :string
    add :correo, :string
    add :username, :string, null: false
    add :password_hash, :string
    timestamps
  end
  create unique_index(:users, [:username])
  end
  
end