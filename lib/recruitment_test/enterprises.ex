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
end
