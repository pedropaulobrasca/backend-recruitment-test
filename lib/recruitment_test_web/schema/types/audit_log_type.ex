defmodule RecruitmentTestWeb.Schema.Types.AuditLogType do
  use Absinthe.Schema.Notation

  object :audit_log do
    field :id, :id
    field :action, :string
    field :occurred_at, :naive_datetime
    field :resource_id, :id
    field :resource_type, :string
    field :details, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
end
