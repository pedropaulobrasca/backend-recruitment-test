defmodule RecruitmentTest.Repo.Migrations.CreateOwnersTable do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :name, :string
      add :document, :string
      add :enterprise_id, references(:enterprises, on_delete: :nothing)

      timestamps()
    end

    create index(:owners, [:enterprise_id])
  end
end
