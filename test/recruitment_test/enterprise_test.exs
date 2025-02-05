defmodule RecruitmentTest.Enterprises do
  use ExUnit.Case
  alias RecruitmentTest.Enterprises.Enterprise

  defp errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

  describe "description validations" do
    test "description is required" do
      changeset = Enterprise.changeset(%Enterprise{}, %{description: nil})
      assert "can't be blank" in errors_on(changeset).description
    end

    test "description has a maximum length of 250 characters" do
      long_description = String.duplicate("a", 251)
      changeset = Enterprise.changeset(%Enterprise{}, %{description: long_description})
      assert "should be at most 250 character(s)" in errors_on(changeset).description
    end
  end

  describe "numbers_only/1" do
    test "removes non-numeric characters" do
      assert Enterprise.numbers_only("123abc456") == "123456"
    end
  end

  describe "cnpj/1" do
    test "accepts only 14-digit numbers" do
      changeset = Enterprise.changeset(%Enterprise{}, %{cnpj: "123456789012345"})
      updated_changeset = Enterprise.handle_cnpj(changeset)
      assert updated_changeset.changes.cnpj == "123456789012345"
    end
  end
end
