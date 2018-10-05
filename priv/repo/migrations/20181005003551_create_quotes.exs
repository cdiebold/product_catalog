defmodule ProductCatalog.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :first_name, :string
      add :last_name, :string
      add :company_name, :string
      add :email_address, :string
      add :phone_number, :string
      add :preferred_contact_method, :string
      add :condition, :string
      add :priority, :string
      add :nsn, :string
      add :part_number, :string
      add :quantity, :integer

      timestamps()
    end

  end
end
