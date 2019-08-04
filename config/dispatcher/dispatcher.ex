defmodule Dispatcher do
  use Plug.Router

  def start(_argv) do
    port = 80
    IO.puts "Starting Plug with Cowboy on port #{port}"
    Plug.Adapters.Cowboy.http __MODULE__, [], port: port
    :timer.sleep(:infinity)
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  match "/users/*path" do
    Proxy.forward conn, path, "http://resource/users/"
  end

  match "/tasks/*path" do
    Proxy.forward conn, path, "http://resource/tasks/"
  end

  match "/tags/*path" do
    Proxy.forward conn, path, "http://resource/tags/"
  end

  match "/themes/*path" do
    Proxy.forward conn, path, "http://resource/themes/"
  end

  match "/projects/*path" do
    Proxy.forward conn, path, "http://resource/projects/"
  end

  # match "/registration/*path" do
  #   Proxy.forward conn, path, "http://registration/"
  # end

  match "/login/*path" do
    Proxy.forward conn, path, "http://login/"
  end

  match "/sessions/*path" do
    Proxy.forward conn, path, "http://login/sessions/"
  end

  match _ do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end
