defmodule VibrantVolumes.Readings.Category do
  use VibrantVolumes.Schema
  import Ecto.Changeset

  alias VibrantVolumes.Accounts.User

  @type t :: %__MODULE__{
    id: Ecto.UUID.t(),
    category_name: String.t(),
    user_id: Ecto.UUID.t(),
    user: User.t(),
    inserted_at: NaiveDateTime.t(),
    updated_at: NaiveDateTime.t()
  }

  schema "categories" do
    field :category_name, :string
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:category_name])
    |> validate_required([:category_name])
  end
end
