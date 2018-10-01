defmodule ProductCatalog.CRM.CRMTest do
  use ProductCatalog.DataCase

  alias ProductCatalog.CRM
  alias ProductCatalog.CRM.Comment

  test "build_comment/0 returns a comment changeset" do
    assert %Ecto.Changeset{data: %Comment{}} = CRM.build_comment()
  end

  test "build_comment/1 returns a comment changeset with values applied" do
    attrs = %{"title" => "My fitst order"}
    changeset = CRM.build_comment(attrs)
    assert changeset.params == attrs
  end

  test "build_comment/1 returns a comment for valid data" do
    valid_attrs = %{
      "title" => "The best logistics company on the space coast",
      "message" => "You now have a customer for life. Fuck the competition."
    }

    assert {:ok, comment} = CRM.create_comment(valid_attrs)
  end

  test "create_comment/1 returns a changeset for invalid data" do
    invalid_attrs = %{}
    assert {:error, %Ecto.Changeset{}} = CRM.create_comment(invalid_attrs)
  end
end
