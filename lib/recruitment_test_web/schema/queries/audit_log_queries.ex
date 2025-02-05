defmodule RecruitmentTestWeb.Schema.Queries.AuditLogQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.AuditLogResolver

  object :audit_log_queries do
    @desc "Listar todos os logs de auditoria"
    field :audit_logs, list_of(:audit_log) do
      resolve(&AuditLogResolver.list_audit_logs/3)
    end
  end
end
