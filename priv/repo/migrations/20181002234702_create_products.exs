defmodule ProductCatalog.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :nsn, :string

      timestamps()
    end

  end
end
