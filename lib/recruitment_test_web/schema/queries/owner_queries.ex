defmodule RecruitmentTestWeb.Schema.Queries.OwnerQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.OwnerResolver

  object :owner_queries do
    @desc "Listar todos os owners com paginação"
    field :owners, :paginated_owners_list do
      arg :page_size, :integer, default_value: 10
      arg :page_number, :integer, default_value: 1
      resolve(&OwnerResolver.list_owners/3)
    end

    @desc "Buscar owner por ID"
    field :owner, :owner do
      arg :id, non_null(:id)
      resolve(&OwnerResolver.get_owner/3)
    end

    @desc "Filtrar owners por nome com paginação"
    field :filter_owners, :paginated_owners_list do
      arg :filters, :owner_filter
      arg :page_size, :integer, default_value: 10
      arg :page_number, :integer, default_value: 1
      resolve(&OwnerResolver.filter_owners/3)
    end
  end
end
