defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema

  import_types(RecruitmentTestWeb.Schema.Types.EnterpriseType)
  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)

  query do
    import_fields(:enterprise_queries)
  end
end
