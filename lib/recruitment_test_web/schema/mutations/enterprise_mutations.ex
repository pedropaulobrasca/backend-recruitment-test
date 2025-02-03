defmodule RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations do
  use Absinthe.Schema.Notation

  alias RecruitmentTest.Enterprises

  object :enterprise_mutations_fields do
    field :create_enterprise, :enterprise do
      arg :name, non_null(:string)
      arg :commercial_name, non_null(:string)
      arg :cnpj, non_null(:string)
      arg :description, non_null(:string)

      resolve &create_enterprise/3
    end

    field :update_enterprise, :enterprise do
      arg :id, non_null(:id)
      arg :name, :string
      arg :commercial_name, :string
      arg :cnpj, :string
      arg :description, :string

      resolve &update_enterprise/3
    end

    field :delete_enterprise, :enterprise do
      arg :id, non_null(:id)

      resolve &delete_enterprise/3
    end
  end

  def create_enterprise(_parent, args, _resolution) do
    case Enterprises.create_enterprise(args) do
      {:ok, enterprise} ->
        RecruitmentTest.AuditLog.changeset(%RecruitmentTest.AuditLog{}, %{
          action: "create",
          occurred_at: DateTime.utc_now(),
          resource_id: enterprise.id,
          resource_type: "enterprise",
          details: %{
            name: enterprise.name,
            commercial_name: enterprise.commercial_name,
            cnpj: enterprise.cnpj,
            description: enterprise.description
          }
        }) |> RecruitmentTest.Repo.insert!()
        {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao criar empresa: #{inspect(changeset.errors)}"}
    end
  end

  def update_enterprise(_parent, args, _resolution) do
    enterprise = Enterprises.get_enterprise!(args.id)
    IO.inspect(args)

    case Enterprises.update_enterprise(enterprise, args) do
      {:ok, enterprise} ->
        RecruitmentTest.AuditLog.changeset(%RecruitmentTest.AuditLog{}, %{
          action: "update",
          occurred_at: DateTime.utc_now(),
          resource_id: enterprise.id,
          resource_type: "enterprise",
          details: %{
            name: enterprise.name,
            commercial_name: enterprise.commercial_name,
            cnpj: enterprise.cnpj,
            description: enterprise.description
          }
        }) |> RecruitmentTest.Repo.insert!()
        {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao atualizar empresa: #{inspect(changeset.errors)}"}
    end
  end

  def delete_enterprise(_parent, args, _resolution) do
    enterprise = Enterprises.get_enterprise!(args.id)

    case Enterprises.delete_enterprise(enterprise) do
      {:ok, enterprise} ->
        RecruitmentTest.AuditLog.changeset(%RecruitmentTest.AuditLog{}, %{
          action: "delete",
          occurred_at: DateTime.utc_now(),
          resource_id: enterprise.id,
          resource_type: "enterprise",
          details: %{
            name: enterprise.name,
            commercial_name: enterprise.commercial_name,
            cnpj: enterprise.cnpj,
            description: enterprise.description
          }
        }) |> RecruitmentTest.Repo.insert!()
        {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao deletar empresa: #{inspect(changeset.errors)}"}
    end
  end
end
