defmodule Mix.Tasks.VirtualGymWeb.OpenApiSpec do
  @moduledoc """
  Mix tast to generate open api spec json in priv folder running mix spec
  """
  def run([]) do
    VirtualGymWeb.Endpoint.start_link()

    VirtualGymWeb.ApiSpec.spec()
    |> Jason.encode!(pretty: true, maps: :strict)
    |> (&File.write!("./priv/static/openapi3_v1.0.json", &1)).()
  end
end
