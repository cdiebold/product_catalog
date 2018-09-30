defmodule ProductCatalogWeb.PageController do
  use ProductCatalogWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
