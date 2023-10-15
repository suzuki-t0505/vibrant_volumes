defmodule VibrantVolumes.Readings.ReadingList do
  use VibrantVolumes.Schema
  import Ecto.Changeset

  alias VibrantVolumes.Accounts.User
  alias VibrantVolumes.Readings.Category

  @type t :: %__MODULE__{
    id: Ecto.UUID.t(),
    favorite?: boolean(),
    memo: String.t(),
    status: String.t(),
    title: String.t(),
    url: String.t(),
    user_id: Ecto.UUID.t(),
    user: User.t(),
    category_id: Ecto.UUID.t(),
    category: Category.t(),
    inserted_at: NaiveDateTime.t(),
    updated_at: NaiveDateTime.t()
  }

  schema "reading_lists" do
    field :favorite?, :boolean, default: false
    field :memo, :string
    field :status, :string
    field :title, :string
    field :url, :string
    belongs_to(:user, User)
    belongs_to(:category, Category)

    timestamps()
  end

  @doc false
  def changeset(reading_list, attrs) do
    reading_list
    |> cast(attrs, [:url, :title, :memo, :status, :favorite?])
    |> validate_required([:url, :title, :memo, :status, :favorite?])
  end
end
