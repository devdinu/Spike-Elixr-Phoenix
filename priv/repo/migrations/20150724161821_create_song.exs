defmodule Sample.Repo.Migrations.CreateSong do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :size, :integer

      timestamps
    end

  end
end
