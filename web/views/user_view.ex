defmodule Flashtiket.UserView do
use Flashtiket.Web, :view
alias Flashtiket.User

def first_name(%User{name: name}) do
name
|> String.split(" ")
|> Enum.at(0)
end
end