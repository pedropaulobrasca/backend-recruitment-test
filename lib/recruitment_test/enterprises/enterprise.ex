defmodule RecruitmentTest.Enterprises.Enterprise do
  @moduledoc """
  Entidade responsável por representar empresas no sistema.

  Campos obrigatórios:
  - Nome legal (name)
  - Nome comercial (commercial_name)
  - CNPJ (formato 14 dígitos)
  - Descrição (até 250 caracteres)
  """
  use RecruitmentTest.Schema

  import Ecto.Changeset

  schema "enterprises" do
    field :name, :string
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(enterprise, attrs) do
    enterprise
    |> cast(attrs, [
      :name,
      :commercial_name,
      :cnpj,
      :description
    ])
    |> handle_name()
    |> handle_commercial_name()
    |> handle_cnpj()
    |> handle_description()
  end

  defp handle_name(changeset) do
    changeset
    |> validate_required(:name)
    |> validate_length(:name, max: 250)
  end

  defp handle_commercial_name(changeset) do
    changeset
    |> validate_required(:commercial_name)
    |> validate_length(:commercial_name, max: 250)
  end

  defp handle_cnpj(changeset) do
    changeset
    |> validate_required(:cnpj)
    |> update_change(:cnpj, &numbers_only/1)
    |> validate_length(:cnpj, is: 14)
    |> unique_constraint(:cnpj)
  end

  defp handle_description(changeset) do
    changeset
    |> validate_required(:description)
    |> validate_length(:description, max: 250)
  end

  defp numbers_only(value) do
    String.replace(value, ~r/[^\d]/, "")
  end
end
