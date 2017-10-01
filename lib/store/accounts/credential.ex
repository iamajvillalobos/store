defmodule Store.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Store.Accounts.Credential


  schema "credentails" do
    field :email, :string
    field :merchant_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
