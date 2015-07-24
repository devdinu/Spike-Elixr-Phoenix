defmodule Sample.MusicController do
	use Sample.Web, :controller

	alias Sample.Song		

	def index(conn, _params) do
		songs = Repo.all(Song)
		render(conn, "playlist.html", songs: songs)
	end

	def voted_songs(conn, _params) do		
		top_voted_songs = Repo.all(Song)
		render(conn, "vote.html", topsongs: top_voted_songs)
	end

	def update(conn, %{"id" => id}) do		
		csong = Repo.get!(Song, id)
		changeset = Song.vote(csong)
		# changeset = Song.changeset(csong, %{})
		# if changeset.valid? do
			conn
      |> put_flash(:info, "Song updated successfully.")
      |> redirect(to: song_path(conn, :index))
      Repo.update!(changeset)
   #    	else
			# render(conn, "playlist.html", topsongs: %{})
		# end
    
	end

end
