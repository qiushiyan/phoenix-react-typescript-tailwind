defmodule React.Repo do
  use Ecto.Repo,
    otp_app: :react,
    adapter: Ecto.Adapters.Postgres
end
