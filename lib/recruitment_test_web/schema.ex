defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(RecruitmentTestWeb.Schema.Types.ContentTypes)
  import_types(RecruitmentTestWeb.Schema.Types.EnterpriseType)
  import_types(RecruitmentTestWeb.Schema.Types.OwnerType)
  import_types(RecruitmentTestWeb.Schema.Types.AuditLogType)

  import_types(RecruitmentTestWeb.Schema.Queries.EnterpriseQueries)
  import_types(RecruitmentTestWeb.Schema.Queries.OwnerQueries)
  import_types(RecruitmentTestWeb.Schema.Queries.AuditLogQueries)

  import_types(RecruitmentTestWeb.Schema.Mutations.EnterpriseMutations)
  import_types(RecruitmentTestWeb.Schema.Mutations.OwnerMutations)

  scalar :map, description: "Map scalar type" do
    serialize &Poison.encode!/1
    parse &Poison.decode!/1
  end

  query do
    import_fields(:enterprise_queries)
    import_fields(:owner_queries)
    import_fields(:audit_log_queries)
  end

  mutation do
    import_fields(:enterprise_mutations_fields)
    import_fields(:owner_mutation_fields)
  end
end
