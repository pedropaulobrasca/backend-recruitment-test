defmodule RecruitmentTestWeb.Resolvers.EnterpriseResolver do
  alias RecruitmentTest.Enterprises
  alias RecruitmentTest.AuditLogs

  def list_enterprises(_parent, args, _resolution) do
    page_number = Map.get(args, :page_number, 1)
    page_size = Map.get(args, :page_size, 10)

    enterprises = Enterprises.list_enterprises()
    total_entries = length(enterprises)
    total_pages = ceil(total_entries / page_size)

    paginated_entries = enterprises
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

  def get_enterprise(_parent, %{id: id}, _resolution) do
    case Enterprises.get_enterprise(id) do
      nil -> {:error, "Enterprise not found"}
      enterprise -> {:ok, enterprise}
    end
  end

  def filter_enterprises(_parent, args, _resolution) do
    page_number = Map.get(args, :page_number, 1)
    page_size = Map.get(args, :page_size, 10)
    filters = Map.get(args, :filters, %{})

    enterprises = Enterprises.filter_enterprises(filters)
    total_entries = length(enterprises)
    total_pages = ceil(total_entries / page_size)

    paginated_entries = enterprises
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

  def create_enterprise(_parent, args, _resolution) do
    case Enterprises.create_enterprise(args) do
      {:ok, enterprise} ->
        AuditLogs.log_action("create_enterprise", enterprise)
        {:ok, enterprise}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_enterprise(_parent, %{id: id} = args, _resolution) do
    case Enterprises.update_enterprise(id, args) do
      {:ok, enterprise} ->
        AuditLogs.log_action("update_enterprise", enterprise)
        {:ok, enterprise}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_enterprise(_parent, %{id: id}, _resolution) do
    case Enterprises.delete_enterprise(id) do
      {:ok, enterprise} ->
        AuditLogs.log_action("delete_enterprise", enterprise)
        {:ok, enterprise}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  defp extract_error_msg(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, _} -> msg end)
  end
end
