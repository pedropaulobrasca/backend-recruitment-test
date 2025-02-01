defmodule RecruitmentTest.Owners.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :name, :string
    field :document, :string
    belongs_to :enterprise, RecruitmentTest.Enterprises.Enterprise

    timestamps()
  end

  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:name, :document, :enterprise_id])
    |> validate_required([:name, :document, :enterprise_id])
  end
end
