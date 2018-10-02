defmodule ProductCatalog.Acceptance.CommentFormTest do
  use ProductCatalog.DataCase
  use Hound.Helpers

  hound_session()

  test "creates a comment with valid content" do
    navigate_to("/contact")
    form = find_element(:id, "comment-form")

    find_within_element(form, :name, "comment[title]")
    |> fill_field("Order wasnt packaged correctly")

    find_within_element(form, :name, "comment[message]")
    |> fill_field("Can you email me a return slip please")

    find_within_element(form, :tag, "button") |> click
    message = find_element(:id, "form-error") |> visible_text()
    assert message == "Comment submitted successfully"
  end

  test "invalid comments will show error messages" do
    navigate_to("/contact")
    form = find_element(:id, "comment-form")
    find_within_element(form, :tag, "button") |> click

    assert current_path() == "/contact"
    message = find_element(:id, "form-error") |> visible_text()
    assert message == "Comment could not be submitted! Please check the errors below."
  end
end
