defmodule ProductCatalogWeb.Router do
  use ProductCatalogWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ProductCatalogWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/contact", ContactController, :new)
    post("/contact", ContactController, :create)
  end

  if Mix.env() == :dev do
    forward("/sent_emails", Bamboo.SentEmailViewerPlug)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProductCatalogWeb do
  #   pipe_through :api
  # end
end
