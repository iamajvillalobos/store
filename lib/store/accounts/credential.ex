defmodule Store.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Store.Accounts.{Credential, Merchant}


  schema "credentails" do
    field :email, :string
    field :password, :string
    belongs_to :merchant, Merchant

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
  end
end
