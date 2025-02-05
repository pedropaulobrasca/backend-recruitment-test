defmodule RecruitmentTest.Repo.Migrations.AddUniqueIndexToOwnersDocument do
  use Ecto.Migration

  def up do
    # Primeiro remove duplicatas
    execute """
    DELETE FROM owners a USING owners b
    WHERE a.document = b.document 
    AND a.id > b.id;
    """
    
    # Depois cria o índice único
    create unique_index(:owners, [:document], name: :owners_document_index)
  end

  def down do
    drop index(:owners, [:document], name: :owners_document_index)
  end
end
