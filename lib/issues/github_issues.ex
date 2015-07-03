defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir larrylv1990@gmail.com"} ]

  def fetch(user, project) do
    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, response}), do: {:ok, response.body}
  def handle_response({:error, response}), do: {:error, response.body}
end
