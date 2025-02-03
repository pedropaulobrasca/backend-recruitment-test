defmodule RecruitmentTestWeb.Schema.Mutations.OwnerMutations do
  use Absinthe.Schema.Notation

  alias RecruitmentTest.Owners

  object :owner_mutation_fields do
    field :create_owner, :owner do
      arg :name, non_null(:string)
      arg :document, non_null(:string)
      arg :enterprise_id, non_null(:id)

      resolve &create_owner/3
    end

    field :update_owner, :owner do
      arg :id, non_null(:id)
      arg :name, :string
      arg :document, :string
      arg :enterprise_id, :id

      resolve &update_owner/3
    end

    field :delete_owner, :owner do
      arg :id, non_null(:id)

      resolve &delete_owner/3
    end
  end

  def create_owner(_parent, args, _resolution) do
    case Owners.create_owner(args) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, "Erro ao criar owner: #{inspect(changeset.errors)}"}
    end
  end

  def update_owner(_parent, args, _resolution) do
    owner = Owners.get_owner!(args.id)
    IO.inspect(args)

    case Owners.update_owner(owner, args) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, "Erro ao atualizar owner: #{inspect(changeset.errors)}"}
    end
  end

  def delete_owner(_parent, args, _resolution) do
    owner = Owners.get_owner!(args.id)

    case Owners.delete_owner(owner) do
      {:ok, owner} -> {:ok, owner}
      {:error, changeset} -> {:error, "Erro ao deletar owner: #{inspect(changeset.errors)}"}
    end
  end
end
