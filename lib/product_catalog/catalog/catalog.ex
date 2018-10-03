defmodule ProductCatalog.Catalog.Catalog do
    alias ProductCatalog.Repo
    def list_all_products do
      product |>
        Repo.all()
    end
end
