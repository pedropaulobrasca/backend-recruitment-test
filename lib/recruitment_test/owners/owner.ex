defmodule RecruitmentTest.Owners.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "owners" do
    field :name, :string
    field :document, :string
    belongs_to :enterprise, RecruitmentTest.Enterprises.Enterprise

    timestamps()
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:name, :document, :enterprise_id])
    |> validate_required([:name, :document, :enterprise_id])
    |> foreign_key_constraint(:enterprise_id)
    |> handle_document()
  end

  def handle_document(changeset) do
    changeset
    |> update_change(:document, &numbers_only/1)
    |> validate_length(:document, max: 14)
    |> unique_constraint(:document, name: :owners_document_index, message: "já existe um owner com este documento")
  end

  def numbers_only(value) do
    String.replace(value, ~r/[^\d]/, "")
  end
end
