defmodule Sample.Song do
  use Sample.Web, :model

  schema "songs" do
    field :name, :string
    field :size, :integer
    field :votes, :integer

    timestamps
  end

  @required_fields ~w(name size)
  @optional_fields ~w(votes)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  
  def vote(model) do
    # model.votes = 100
    model
  end

end
