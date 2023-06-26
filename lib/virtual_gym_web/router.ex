defmodule VirtualGymWeb.Router do
  use VirtualGymWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {VirtualGymWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VirtualGymWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api", VirtualGymWeb do
    pipe_through :api
    resources "/exercises", ExerciseController, except: [:new, :edit]
    resources "/iterations", IterationController, except: [:new, :edit]
    resources "/series", SerieController, except: [:new, :edit]
    resources "/super_series", SuperSerieController, except: [:new, :edit]
    resources "/activities", ActivityController, except: [:new, :edit]
    resources "/routines", RoutineController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/trainers", TrainerController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:virtual_gym, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: VirtualGymWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
