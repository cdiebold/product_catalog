defmodule ProductCatalog.Sale.Quote do
  use Ecto.Schema
  import Ecto.Changeset


  schema "quotes" do
    field :company_name, :string
    field :condition, :string
    field :email_address, :string
    field :first_name, :string
    field :last_name, :string
    field :nsn, :string
    field :part_number, :string
    field :phone_number, :string
    field :preferred_contact_method, :string
    field :priority, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:first_name, :last_name, :company_name, :email_address, :phone_number, :preferred_contact_method, :condition, :priority, :nsn, :part_number, :quantity])
    |> validate_required([:first_name, :last_name, :company_name, :email_address, :phone_number, :preferred_contact_method, :condition, :priority, :nsn, :part_number, :quantity])
  end
end
