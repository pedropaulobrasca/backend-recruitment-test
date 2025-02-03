defmodule RecruitmentTestWeb.Schema.Queries.OwnerQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.OwnerResolver

  object :owner_queries do
    @desc "Listar todos os owners"
    field :owners, list_of(:owner) do
      resolve(&OwnerResolver.list_owners/3)
    end

    @desc "Buscar owner por ID"
    field :owner, :owner do
      arg :id, non_null(:id)
      resolve(&OwnerResolver.get_owner/3)
    end

    @desc "Filtrar owners por nome"
    field :filter_owners, list_of(:owner) do
      arg :filters, :owner_filter

      resolve(&OwnerResolver.filter_owners/3)
    end
  end
end
