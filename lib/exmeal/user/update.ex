defmodule Exmeal.Users.Update do
  alias Exmeal.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> User.changeset(params)
    |> Repo.update()
  end
end
