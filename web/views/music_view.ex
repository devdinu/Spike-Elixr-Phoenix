defmodule Sample.MusicView do
  use Sample.Web, :view
  def get_list() do
	s1=%Sample.Song{name: "abcd", votes: 1}
	s2=%Sample.Song{name: "ab2", votes: 2}
	[s1,s2]
  end
end
