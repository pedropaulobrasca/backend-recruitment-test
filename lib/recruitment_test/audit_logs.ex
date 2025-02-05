defmodule RecruitmentTest.AuditLogs do
  import Ecto.Query, warn: false
  alias RecruitmentTest.Repo
  alias RecruitmentTest.AuditLog

  def list_audit_logs do
    Repo.all(AuditLog)
  end
end
