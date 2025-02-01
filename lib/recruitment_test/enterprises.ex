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
    Enum.reduce(filters, query, fn
      {:name, value}, query when is_binary(value) ->
        where(query, [e], ilike(e.name, ^"%#{value}%"))
      
      {:commercial_name, value}, query when is_binary(value) ->
        where(query, [e], ilike(e.commercial_name, ^"%#{value}%"))
      
      {:cnpj, value}, query when is_binary(value) ->
        where(query, [e], ilike(e.cnpj, ^"%#{value}%"))
      
      {:description, value}, query when is_binary(value) ->
        where(query, [e], ilike(e.description, ^"%#{value}%"))
      
      _, query ->
        query
    end)
    |> Repo.all()
  end
end
