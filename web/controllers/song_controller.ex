defmodule Sample.SongController do
  use Sample.Web, :controller

  alias Sample.Song

  plug :scrub_params, "song" when action in [:create, :update]

  def get_songs() do
    songs = Repo.all(Song)
  end

  def index(conn, _params) do
    render(conn, "index.html", songs: get_songs())
  end

  def new(conn, _params) do
    changeset = Song.changeset(%Song{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"song" => song_params}) do
    changeset = Song.changeset(%Song{}, song_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Song created successfully.")
      |> redirect(to: song_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    render(conn, "show.html", song: song)
  end

  def edit(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    changeset = Song.changeset(song)
    render(conn, "edit.html", song: song, changeset: changeset)
  end

  def update(conn, %{"id" => id, "song" => song_params}) do
    song = Repo.get!(Song, id)
    changeset = Song.changeset(song, song_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Song updated successfully.")
      |> redirect(to: song_path(conn, :index))
    else
      render(conn, "edit.html", song: song, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    Repo.delete!(song)

    conn
    |> put_flash(:info, "Song deleted successfully.")
    |> redirect(to: song_path(conn, :index))
  end
end
