defmodule RecruitmentTest.Repo.Migrations.CreateOwnersTable do
  use Ecto.Migration

  def change do
    create table(:owners, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :document, :string
      add :enterprise_id, references(:enterprises, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:owners, [:enterprise_id])
  end
end
