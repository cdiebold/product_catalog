defmodule ProductCatalog.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :name, :string
      add :nsn, :string, primary_key: true

      timestamps()
    end

  end
end
