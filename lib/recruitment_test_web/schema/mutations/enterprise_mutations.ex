defmodule RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations do
  use Absinthe.Schema.Notation

  alias RecruitmentTest.Enterprises

  object :enterprise_mutations do
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
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao criar empresa: #{inspect(changeset.errors)}"}
    end
  end

  def update_enterprise(_parent, args, _resolution) do
    enterprise = Enterprises.get_enterprise!(args.id)
    IO.inspect(args)

    case Enterprises.update_enterprise(enterprise, args) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao atualizar empresa: #{inspect(changeset.errors)}"}
    end
  end

  def delete_enterprise(_parent, args, _resolution) do
    enterprise = Enterprises.get_enterprise!(args.id)

    case Enterprises.delete_enterprise(enterprise) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao deletar empresa: #{inspect(changeset.errors)}"}
    end
  end
end
