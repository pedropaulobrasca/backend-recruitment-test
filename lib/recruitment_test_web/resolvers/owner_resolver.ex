defmodule RecruitmentTestWeb.Resolvers.OwnerResolver do
  alias RecruitmentTest.Owners

  def list_owners(_parent, _args, _resolution) do
    {:ok, Owners.list_owners()}
  end

  def get_owner(_parent, %{id: id}, _resolution) do
    case Owners.get_owner!(id) do
      nil -> {:error, "Owner not found"}
      owner -> {:ok, owner}
    end
  end

  def create_owner(_parent, args, _resolution) do
    case Owners.create_owner(args) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update_owner(_parent, %{id: id} = args, _resolution) do
    owner = Owners.get_owner!(id)

    case Owners.update_owner(owner, args) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def delete_owner(_parent, %{id: id}, _resolution) do
    owner = Owners.get_owner!(id)

    case Owners.delete_owner(owner) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
