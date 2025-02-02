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
  end

  def create_enterprise(_parent, args, _resolution) do
    case Enterprises.create_enterprise(args) do
      {:ok, enterprise} -> {:ok, enterprise}
      {:error, changeset} -> {:error, "Erro ao criar empresa: #{inspect(changeset.errors)}"}
    end
  end
end
