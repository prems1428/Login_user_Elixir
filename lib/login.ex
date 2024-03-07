defmodule Login do

  defstruct(
    name: "",
    password: 0
  )
  @moduledoc """
  Documentation for `Login`.
  This module provides functionality for user login and password verification.

  Example :

     iex > Login.authenticate(%Login{name: "Peter", password: 1234})
     {:ok, "Peter successfully logged in"}

     iex > Login.authenticate(%Login{name: "Peter", password: 12384})
     {:error, "Unauthorized"}

     iex > Login.authenticate(%Login{name: "Petessr", password: 1234})
     {:error, "User not found"}
  """

  @type t :: %Login{
    name: String.t(),
    password: number()
  }

  def get_list() do
    [
      %Login{name: "Peter" , password: 1234},
      %Login{name: "Bobs" , password: 4567},
      %Login{name: "Kevin" , password: 7890},
      %Login{name: "Rabert" , password: 1232},
   ]
  end

  @spec authenticate(%Login{name: String.t(), password: String.t()}) :: {:ok, String.t()} | {:error, String.t()}

  def authenticate(%Login{name: name, password: password}) do
    case Enum.find(get_list(), &(&1.name == name)) do
      nil -> {:error, "User not found"}
      %Login{name: _, password: stored_password} ->
        if password == stored_password do
          {:ok, "#{name} successfully logged in"}
        else
          {:error, "Unauthorized"}
        end
    end
end

end
