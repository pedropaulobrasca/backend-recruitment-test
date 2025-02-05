defmodule RecruitmentTestWeb.Schema.Types.ContentTypes do
  use Absinthe.Schema.Notation

  object :page_info do
    field :page_size, :integer
    field :page_number, :integer
    field :total_entries, :integer
    field :total_pages, :integer
  end

  object :paginated_list do
    field :entries, list_of(:enterprise)
    field :page_info, :page_info
  end

  object :paginated_owners_list do
    field :entries, list_of(:owner)
    field :page_info, :page_info
  end
end
