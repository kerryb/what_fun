import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :what_fun, WhatFunWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wumJyK6Vp6w9u5euBD8VZ2hURw8a/i+9vC+EBrAxuxfBOEJPmk7X3l9R7Hvxwpe2",
  server: false

# In test we don't send emails.
config :what_fun, WhatFun.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
