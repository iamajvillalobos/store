defmodule Store.Repo.Migrations.CreateCredentails do
  use Ecto.Migration

  def change do
    create table(:credentails) do
      add :email, :string
      add :merchant_id, references(:merchants, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:credentails, [:email])
    create index(:credentails, [:merchant_id])
  end
end
