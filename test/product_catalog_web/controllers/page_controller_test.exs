defmodule ProductCatalogWeb.PageControllerTest do
  use ProductCatalogWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "NSN Parts"
  end
end
