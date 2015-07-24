defmodule Sample.Repo.Migrations.AddVotesToSong do
	use Ecto.Migration

	def change do
		alter table(:songs) do
			add :votes, :integer
		end

	end
end