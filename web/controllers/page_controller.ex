defmodule Mechanize.PageController do
  use Mechanize.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
