defmodule RecruitmentTest.Enterprises do
  @moduledoc """
  Interface principal para operações com empresas.
  """
  import Ecto.Query, warn: false
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Enterprises.Enterprise

  def create_enterprise(attrs) do
    %Enterprise{}
    |> Enterprise.changeset(attrs)
    |> Repo.insert()
  end

  def get_enterprise!(id), do: Repo.get!(Enterprise, id)

  def list_enterprises, do: Repo.all(Enterprise)

  def update_enterprise(%Enterprise{} = enterprise, attrs) do
    enterprise
    |> Enterprise.changeset(attrs)
    |> Repo.update()
  end

  def delete_enterprise(%Enterprise{} = enterprise) do
    Repo.delete(enterprise)
  end

  def filter_enterprises(query, filters) do
    from e in query,
        where: ilike(e.name, ^"%#{filters[:name]}%") and
               ilike(e.commercial_name, ^"%#{filters[:commercial_name]}%") and
               ilike(e.cnpj, ^"%#{filters[:cnpj]}%") and
               ilike(e.description, ^"%#{filters[:description]}%")
  end
end
