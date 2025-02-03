defmodule RecruitmentTestWeb.Schema.Types.OwnerType do
  use Absinthe.Schema.Notation

  object :owner do
    field :id, :id
    field :name, :string
    field :document, :string
    field :enterprise, :enterprise
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :owner_filter do
    field :name, :string
    field :document, :string
  end
end
