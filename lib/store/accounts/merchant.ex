defmodule Store.Accounts.Merchant do
  use Ecto.Schema
  import Ecto.Changeset
  alias Store.Accounts.Merchant


  schema "merchants" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Merchant{} = merchant, attrs) do
    merchant
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
