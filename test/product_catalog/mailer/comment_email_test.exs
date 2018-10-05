defmodule ProductCatalog.Mailer.CommentEmailTest do
  use ExUnit.Case
  use Bamboo.Test
  import Bamboo.Email

  alias ProductCatalog.Mailer

  @sender "cdiebold2012@gmail.com"
  @receiver "cdiebold2012@gmail.com"

  test "creating an comment email" do
    email =
      new_email()
      |> to(@receiver)
      |> from(@sender)
      |> subject("New Customer Comment")
      |> text_body("Some new comment was entered by the user")
      |> html_body("<h1>Some new comment was entered by the user</h1>")

    assert email.to == "cdiebold2012@gmail.com"
    assert email.from == "cdiebold2012@gmail.com"
    assert email.subject == "New Customer Comment"
  end

  test "deliver email" do
    email =
      base_email()
      |> to(@receiver)

    email |> Mailer.deliver_now()

    assert_delivered_email(email)
  end

  defp base_email do
    new_email()
    |> to(@receiver)
    |> from(@sender)
    |> subject("New Customer Comment")
    |> text_body("Some new comment was entered by the user")
    |> html_body("<h1>Some new comment was entered by the user</h1>")
  end
end
