defmodule ProductCatalog.CRM.CommentTest do
  use ProductCatalog.DataCase

  alias ProductCatalog.CRM.Comment

  @valid_attrs %{
    title: "Need to return an item",
    message: "order number 342wsx wrong part ordered"
  }

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Comment.changeset(%Comment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Comment.changeset(%Comment{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "title must be at least 5 characters in length" do
    attrs = %{@valid_attrs | title: "I"}
    changeset = Comment.changeset(%Comment{}, attrs)
    assert %{title: ["should be at least 5 character(s)"]} = errors_on(changeset)
  end

  test "title must be at not more than 255 characters in length" do
    attrs = %{@valid_attrs | title: String.duplicate("I", 257)}
    changeset = Comment.changeset(%Comment{}, attrs)
    assert %{title: ["should be at most 255 character(s)"]} = errors_on(changeset)
  end

  test "message must be at least 10 characters in length" do
    attrs = %{@valid_attrs | message: "I"}
    changeset = Comment.changeset(%Comment{}, attrs)
    assert %{message: ["should be at least 10 character(s)"]} = errors_on(changeset)
  end
end
