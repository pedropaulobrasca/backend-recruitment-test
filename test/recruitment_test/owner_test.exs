defmodule RecruitmentTest.Owners do
  use ExUnit.Case
  alias RecruitmentTest.Owners.Owner

  defp errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

  describe "numbers_only/1" do
    test "removes non-numeric characters" do
      assert Owner.numbers_only("123abc456") == "123456"
    end
  end

  describe "document/1" do
    test "accepts only 14-digit numbers" do
      changeset = Owner.changeset(%Owner{}, %{document: "123456789012345"})
      updated_changeset = Owner.handle_document(changeset)
      assert updated_changeset.changes.document == "123456789012345"
    end
  end

end
