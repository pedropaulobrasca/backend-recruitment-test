defmodule RecruitmentTest.Owners do
  use GenServer

  import Ecto.Query, warn: false
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Owners.Owner

  def start_link(_args) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    {:ok, nil}
  end

  def list_owners do
    Owner
    |> Repo.all()
    |> Repo.preload(:enterprise)
  end

  def get_owner!(id) do
    Owner
    |> Repo.get!(id)
    |> Repo.preload(:enterprise)
  end

  def create_owner(attrs \\ %{}) do
    %Owner{}
    |> Owner.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, owner} -> {:ok, Repo.preload(owner, :enterprise)}
      error -> error
    end
  end

  def update_owner(%Owner{} = owner, attrs) do
    owner
    |> Owner.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, owner} -> {:ok, Repo.preload(owner, :enterprise)}
      error -> error
    end
  end

  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  def change_owner(%Owner{} = owner, attrs \\ %{}) do
    Owner.changeset(owner, attrs)
  end

  def filter_owners(filters) do
    query = from(o in Owner)

    query
    |> filter_by_name(filters)
    |> filter_by_document(filters)
    |> Repo.all()
    |> Repo.preload(:enterprise)
  end

  defp filter_by_name(query, %{name: name}) when is_binary(name) do
    where(query, [o], ilike(o.name, ^"%#{name}%"))
  end
  defp filter_by_name(query, _), do: query

  defp filter_by_document(query, %{document: document}) when is_binary(document) do
    where(query, [o], ilike(o.document, ^"%#{document}%"))
  end
  defp filter_by_document(query, _), do: query
end
