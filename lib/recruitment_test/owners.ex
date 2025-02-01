defmodule RecruitmentTest.Owners do
  import Ecto.Query, warn: false
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Owners.Owner

  def list_owners do
    Repo.all(Owner)
  end

  def get_owner!(id), do: Repo.get!(Owner, id)

  def create_owner(attrs \\ %{}) do
    %Owner{}
    |> Owner.changeset(attrs)
    |> Repo.insert()
  end

  def update_owner(%Owner{} = owner, attrs) do
    owner
    |> Owner.changeset(attrs)
    |> Repo.update()
  end

  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  def change_owner(%Owner{} = owner, attrs \\ %{}) do
    Owner.changeset(owner, attrs)
  end
end
