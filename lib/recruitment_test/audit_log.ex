defmodule RecruitmentTest.AuditLog do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "audit_log" do
    field :action, :string
    field :occurred_at, :utc_datetime
    field :resource_id, Ecto.UUID
    field :resource_type, :string
    field :details, :map

    timestamps()
  end

  @doc false
  def changeset(audit_log, attrs) do
    audit_log
    |> cast(attrs, [:action, :occurred_at, :resource_id, :resource_type, :details])
    |> validate_required([:action, :occurred_at, :resource_id, :resource_type])
  end
end
