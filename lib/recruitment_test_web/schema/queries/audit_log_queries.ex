defmodule RecruitmentTestWeb.Schema.Queries.AuditLogQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.AuditLogResolver

  object :audit_log_queries do
    @desc "Listar todos os logs de auditoria com paginação"
    field :audit_logs, :paginated_audit_logs_list do
      arg :page_size, :integer, default_value: 10
      arg :page_number, :integer, default_value: 1
      resolve(&AuditLogResolver.list_audit_logs/3)
    end
  end
end
