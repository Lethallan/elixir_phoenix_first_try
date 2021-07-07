defmodule Project.Word do
  use Ecto.Schema

  schema "words" do
    field :eng, :string
    field :rus, :string
  end

  # %Word{eng: "rain", rus: "дождь"}
end
