defmodule Store.Repo.Migrations.CreateMerchants do
  use Ecto.Migration

  def change do
    create table(:merchants) do
      add :name, :string

      timestamps()
    end

  end
end
