defmodule RecruitmentTestWeb.Resolvers.HelloWorld do
  def get(_parent, _args, _resolution) do
    {:ok, "Hello World :)"}
  end
end
