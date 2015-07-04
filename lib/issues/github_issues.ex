defmodule Issues.GithubIssues do
  @user_agent [ {"User-agent", "Elixir larrylv1990@gmail.com"} ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
      |> HTTPoison.get(@user_agent)
      |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, response}) do
    {:ok, :jsx.decode(response.body)}
  end

  def handle_response({:error, response}) do
    {:error, :jsx.decode(response.body)}
  end
end
