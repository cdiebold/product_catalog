# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :product_catalog,
  ecto_repos: [ProductCatalog.Repo]

# Configures the endpoint
config :product_catalog, ProductCatalogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yONMl7d6smcM/HwonrVckZym9F6pBDnFo5onm3emQNeBriY2IDHzqJOX7vUSJCkt",
  render_errors: [view: ProductCatalogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProductCatalog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
