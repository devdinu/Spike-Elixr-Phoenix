defmodule Sample.Router do
  use Sample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Sample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # get "/musics", MusicController, :index
    get "/music", MusicController, :index
    resources "song", SongController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Sample do
  #   pipe_through :api
  # end
end
