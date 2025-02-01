defmodule RecruitmentTestWeb.Resolvers.EnterpriseResolver do
  alias RecruitmentTest.Enterprises
  alias RecruitmentTest.Enterprises.Enterprise

  def list_enterprises(_parent, _args, _resolution) do
    {:ok, Enterprises.list_enterprises()}
  end

  def get_enterprise(_parent, %{id: id}, _resolution) do
    case Enterprises.get_enterprise!(id) do
      nil -> {:error, "Enterprise not found"}
      enterprise -> {:ok, enterprise}
    end
  end

  def create_enterprise(_parent, args, _resolution) do
    case Enterprises.create_enterprise(args) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update_enterprise(_parent, %{id: id} = args, _resolution) do
    enterprise = Enterprises.get_enterprise!(id)

    case Enterprises.update_enterprise(enterprise, args) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def delete_enterprise(_parent, %{id: id}, _resolution) do
    enterprise = Enterprises.get_enterprise!(id)

    case Enterprises.delete_enterprise(enterprise) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def filter_enterprises(_parent, %{filters: filters}, _resolution) do
    query = Enterprise
    enterprises = Enterprises.filter_enterprises(query, filters)
    {:ok, enterprises}
  end
end
