defmodule ProductCatalog.Email do
  import Bamboo.Email
  @default_email_address "cdiebold2012@gmail.com"
  def comment_email(title, body) do
    new_email()
    |> to(@default_email_address)
    |> from(@default_email_address)
    |> subject(title)
    |> text_body(body)
    |> html_body("<p> #{body}</p>")
  end
end
