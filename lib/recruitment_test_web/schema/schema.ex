defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes)

  alias RecruitmentTestWeb.Resolvers

  query do
    @desc "Returns a Hello World message"
    field :hello_world, :string do
      resolve(&Resolvers.HelloWorld.get/3)
    end
  end
end
