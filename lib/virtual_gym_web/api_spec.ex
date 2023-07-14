defmodule VirtualGymWeb.ApiSpec do
  @moduledoc """
  Define the api spec setup options
  """

  @behaviour OpenApi
  alias OpenApiSpex.{Info, OpenApi, Paths, Server}
  alias VirtualGymWeb.{Endpoint, Router}

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        Server.from_endpoint(Endpoint, otp_app: :my_app)
      ],
      info: %Info{
        title: "Virtual Gym",
        version: "1.0"
      },
      # populate the paths from a phoenix router
      paths: Paths.from_router(Router)
    }
    # discover request/response schemas from path specs
    |> OpenApiSpex.resolve_schema_modules()
  end
end
