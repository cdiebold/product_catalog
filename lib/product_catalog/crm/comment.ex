defmodule ProductCatalog.CRM.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field(:message, :string)
    field(:title, :string)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:title, :message])
    |> validate_required([:title, :message])
    |> validate_length(:title, min: 5)
    |> validate_length(:title, max: 255)
    |> validate_length(:message, min: 10)
  end
end
