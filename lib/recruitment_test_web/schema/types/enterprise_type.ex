defmodule RecruitmentTestWeb.Schema.Types.EnterpriseType do
  use Absinthe.Schema.Notation

  object :enterprise do
    field :id, :id
    field :name, :string
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  input_object :enterprise_filter do
    field :name, :string
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
  end
end
