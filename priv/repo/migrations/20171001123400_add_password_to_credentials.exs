defmodule Store.Repo.Migrations.AddPasswordToCredentials do
  use Ecto.Migration

  def change do
    alter table(:credentails) do
      add :password, :string
    end
  end
end
