defmodule ProductCatalog.CRM do
  alias ProductCatalog.CRM.Comment
  alias ProductCatalog.Repo

  def build_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
  end

  def create_comment(attrs) do
    attrs
    |> build_comment
    |> Repo.insert()
  end
end
