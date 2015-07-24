defmodule Sample.MusicController do
	use Sample.Web, :controller

	alias Sample.Song		
	def index(conn, _params) do
		songs = Repo.all(Song)
		render conn, "playlist.html"
	end
end
