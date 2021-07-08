# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :project,
  ecto_repos: [Project.Repo]

# Configures the endpoint
config :project, ProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lQ1p+vtXLAvY61ApOwWS6nOWkQD1KlutWnp6ZmDOyUYruA+14z8QGBKtiRF3MjCd",
  render_errors: [view: ProjectWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Project.PubSub,
  live_view: [signing_salt: "ONtaBdWo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# config :project, Project.Mailer,
#   adapter: Bamboo.SMTPAdapter,
#   server: "smtp.yandex.ru",
#   hostname: "your.domain",
#   port: 465,
#   username: "example@example.com", # or {:system, "SMTP_USERNAME"}
#   tls: :if_available, # can be `:always` or `:never`
#   allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
#   tls_log_level: :error,
#   tls_verify: :verify_peer, # optional, can be `:verify_peer` or `:verify_none`
#   tls_cacertfile: "/somewhere/on/disk", # optional, path to the ca truststore
#   tls_cacerts: "…", # optional, DER-encoded trusted certificates
#   tls_depth: 3, # optional, tls certificate chain depth
#   tls_verify_fun: {&:ssl_verify_hostname.verify_fun/3, check_hostname: "your.domain"}, # optional, tls verification function
#   ssl: true,
#   retries: 1,
#   no_mx_lookups: false, # can be `true`
#   auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.
