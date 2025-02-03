defmodule RecruitmentTest.Repo.Migrations.CreateAuditLogs do
  use Ecto.Migration

  def change do
    create table(:audit_log) do
      add :action, :string, null: false
      add :occurred_at, :utc_datetime, null: false
      add :resource_id, :uuid, null: false
      add :resource_type, :string, null: false
      add :details, :map

      timestamps()
    end

    create index(:audit_log, [:resource_id])
    create index(:audit_log, [:resource_type])
  end
end
