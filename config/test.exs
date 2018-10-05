use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :product_catalog, ProductCatalogWeb.Endpoint,
  http: [port: 4001],
  server: true

  config :hound, driver: "phantomjs"
# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :product_catalog, ProductCatalog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "product_catalog_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We'll use the Bamboo.TestAdapter for our tests.  There are other adapters for
# all manner of things, including Mandrill, Sendgrid, Mailgun, and SparkPost, as
# well as one for storing them in memory locally for development purposes.
config :product_catalog, ProductCatalog.Mailer,
  adapter: Bamboo.TestAdapter
