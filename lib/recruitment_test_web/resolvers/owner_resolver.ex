defmodule RecruitmentTestWeb.Resolvers.OwnerResolver do
  alias RecruitmentTest.Owners
  alias RecruitmentTest.AuditLogs

  def list_owners(_parent, args, _resolution) do
    page_number = Map.get(args, :page_number, 1)
    page_size = Map.get(args, :page_size, 10)

    owners = Owners.list_owners()
    total_entries = length(owners)
    total_pages = ceil(total_entries / page_size)

    paginated_entries = owners
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

  def get_owner(_parent, %{id: id}, _resolution) do
    case Owners.get_owner(id) do
      nil -> {:error, "Owner not found"}
      owner -> {:ok, owner}
    end
  end

  def filter_owners(_parent, args, _resolution) do
    page_number = Map.get(args, :page_number, 1)
    page_size = Map.get(args, :page_size, 10)
    filters = Map.get(args, :filters, %{})

    owners = Owners.filter_owners(filters)
    total_entries = length(owners)
    total_pages = ceil(total_entries / page_size)

    paginated_entries = owners
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

  def create_owner(_parent, args, _resolution) do
    case Owners.create_owner(args) do
      {:ok, owner} ->
        AuditLogs.log_action("create_owner", owner)
        {:ok, owner}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def update_owner(_parent, %{id: id} = args, _resolution) do
    case Owners.update_owner(id, args) do
      {:ok, owner} ->
        AuditLogs.log_action("update_owner", owner)
        {:ok, owner}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_owner(_parent, %{id: id}, _resolution) do
    case Owners.delete_owner(id) do
      {:ok, owner} ->
        AuditLogs.log_action("delete_owner", owner)
        {:ok, owner}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  defp extract_error_msg(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, _} -> msg end)
  end
end
