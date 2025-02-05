defmodule RecruitmentTestWeb.Resolvers.AuditLogResolver do
  alias RecruitmentTest.AuditLogs

  def list_audit_logs(_parent, _args, _resolution) do
    {:ok, AuditLogs.list_audit_logs()}
  end
end
