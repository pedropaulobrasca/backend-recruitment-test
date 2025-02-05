defmodule RecruitmentTestWeb.Resolvers.AuditLogResolver do
  alias RecruitmentTest.AuditLogs

  def list_audit_logs(_parent, args, _resolution) do
    page_number = Map.get(args, :page_number, 1)
    page_size = Map.get(args, :page_size, 10)

    audit_logs = AuditLogs.list_audit_logs()
    total_entries = length(audit_logs)
    total_pages = ceil(total_entries / page_size)

    paginated_entries = audit_logs
      |> Enum.slice((page_number - 1) * page_size, page_size)

    {:ok, %{
      entries: paginated_entries,
      page_info: %{
        page_size: page_size,
        page_number: page_number,
        total_entries: total_entries,
        total_pages: total_pages
      }
    }}
  end
end
