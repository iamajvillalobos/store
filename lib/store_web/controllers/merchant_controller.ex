defmodule StoreWeb.MerchantController do
  use StoreWeb, :controller

  alias Store.Accounts
  alias Store.Accounts.Merchant

  def index(conn, _params) do
    merchants = Accounts.list_merchants()
    render(conn, "index.html", merchants: merchants)
  end

  def new(conn, _params) do
    changeset = Accounts.change_merchant(%Merchant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"merchant" => merchant_params}) do
    case Accounts.create_merchant(merchant_params) do
      {:ok, merchant} ->
        conn
        |> put_flash(:info, "Merchant created successfully.")
        |> redirect(to: merchant_path(conn, :show, merchant))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    merchant = Accounts.get_merchant!(id)
    render(conn, "show.html", merchant: merchant)
  end

  def edit(conn, %{"id" => id}) do
    merchant = Accounts.get_merchant!(id)
    changeset = Accounts.change_merchant(merchant)
    render(conn, "edit.html", merchant: merchant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "merchant" => merchant_params}) do
    merchant = Accounts.get_merchant!(id)

    case Accounts.update_merchant(merchant, merchant_params) do
      {:ok, merchant} ->
        conn
        |> put_flash(:info, "Merchant updated successfully.")
        |> redirect(to: merchant_path(conn, :show, merchant))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", merchant: merchant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    merchant = Accounts.get_merchant!(id)
    {:ok, _merchant} = Accounts.delete_merchant(merchant)

    conn
    |> put_flash(:info, "Merchant deleted successfully.")
    |> redirect(to: merchant_path(conn, :index))
  end
end
