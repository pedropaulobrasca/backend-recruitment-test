defmodule RecruitmentTestWeb.Schema.Queries.EnterpriseQueries do
  use Absinthe.Schema.Notation

  alias RecruitmentTestWeb.Resolvers.EnterpriseResolver

  object :enterprise_queries do
    @desc "Listar todas as empresas"
    field :enterprises, list_of(:enterprise) do
      resolve(&EnterpriseResolver.list_enterprises/3)
    end

    @desc "Buscar empresa por ID"
    field :enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve(&EnterpriseResolver.get_enterprise/3)
    end
  end
end
