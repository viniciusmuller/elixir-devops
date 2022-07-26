defmodule Hello.Repo do
  use Ecto.Repo,
    otp_app: :hello,
    adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config =
      config
      |> Keyword.put(:username, System.get_env("PGUSER") || "postgres")
      |> Keyword.put(:password, System.get_env("PGPASSWORD") || "postgres")
      |> Keyword.put(:database, System.get_env("PGDATABASE") || "hello_dev")
      |> Keyword.put(:hostname, System.get_env("PGHOST") || "127.0.0.1")
      |> Keyword.put(:port, get_port())

    {:ok, config}
  end

  defp get_port() do
    case System.get_env("PGPORT") do
      nil -> 5432
      port -> String.to_integer(port)
    end
  end
end
