defmodule Project.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :eng, :string
    field :rus, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:eng, :rus])
    |> validate_required([:eng, :rus])
    |> unique_constraint(:eng)
    # |> validate_format(:email, ~r|регулярное выражение|)
  end

  # case Repo.insert(%Changeset{...}) do
  #   {} ->
  # end
end
