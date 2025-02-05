defmodule RecruitmentTestWeb.Schema.Queries.EnterpriseQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.EnterpriseResolver

  object :enterprise_queries do
    @desc "Listar todas as empresas com paginação"
    field :enterprises, :paginated_list do
      arg :page_size, :integer, default_value: 10
      arg :page_number, :integer, default_value: 1
      resolve(&EnterpriseResolver.list_enterprises/3)
    end

    @desc "Buscar empresa por ID"
    field :enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve(&EnterpriseResolver.get_enterprise/3)
    end

    @desc "Filtrar empresas por nome com paginação"
    field :filter_enterprises, :paginated_list do
      arg :filters, :enterprise_filter
      arg :page_size, :integer, default_value: 10
      arg :page_number, :integer, default_value: 1
      resolve(&EnterpriseResolver.filter_enterprises/3)
    end
  end
end
