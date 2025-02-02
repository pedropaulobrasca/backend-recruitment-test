defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema

  import_types(RecruitmentTestWeb.Schema.Types.EnterpriseType)
  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)
  import_types(RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations)

  query do
    import_fields(:enterprise_queries)
  end

  mutation do
    import_fields(:enterprise_mutations)
  end
end
