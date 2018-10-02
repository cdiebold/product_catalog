defmodule ProductCatalogWeb.ContactController do
  use ProductCatalogWeb, :controller
  alias ProductCatalog.CRM

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
        conn
        |> put_flash(:info, "Comment submitted successfully")
        # TODO: email comment to adellis
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
