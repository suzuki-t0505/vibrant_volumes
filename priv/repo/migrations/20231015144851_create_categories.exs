defmodule VibrantVolumes.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :category_name, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:categories, [:user_id])
    create unique_index(:categories, [:user_id, :category_name])
  end
end
