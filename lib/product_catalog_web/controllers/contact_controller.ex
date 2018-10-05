defmodule ProductCatalogWeb.ContactController do
  use ProductCatalogWeb, :controller
  alias ProductCatalog.CRM
  alias ProductCatalog.{Mailer, Email}

  def index(conn, _params) do
    render(conn, "new.html")
  end

  def new(conn, _) do
    changeset = CRM.build_comment()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"comment" => comment_params}) do
    case CRM.create_comment(comment_params) do
      {:ok, _comment} ->
        send_comment_notification(comment_params["title"], comment_params["message"])

        conn
        |> put_flash(:info, "Comment submitted successfully")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  defp send_comment_notification(titles, body) do
    Email.comment_email(titles, body)
    |> Mailer.deliver_later()
  end
end
