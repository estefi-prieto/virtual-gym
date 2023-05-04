defmodule VirtualGym.Repo do
  use Ecto.Repo,
    otp_app: :virtual_gym,
    adapter: Ecto.Adapters.Postgres
end
