defmodule VibrantVolumes.Repo.Migrations.CreateReadingLists do
  use Ecto.Migration

  def change do
    create table(:reading_lists) do
      add :url, :string, null: false
      add :title, :string, null: false
      add :memo, :text
      add :status, :string, null: false
      add :favorite?, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:reading_lists, [:user_id])
    create index(:reading_lists, [:category_id])
    create unique_index(:reading_lists, [:user_id, :url])
  end
end
