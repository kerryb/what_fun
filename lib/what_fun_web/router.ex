defmodule WhatFunWeb.Router do
  use WhatFunWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WhatFunWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", WhatFunWeb do
    pipe_through :browser
    live "/", HomeLive
  end

  if Application.compile_env(:what_fun, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: WhatFunWeb.Telemetry
    end
  end
end
