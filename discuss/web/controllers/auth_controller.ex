defmodule Discuss.AuthController do
    use Discuss.Web, :controller
    plug Ueberauth

    alias Discuss.User

    def callback(%{assigns: %{ueberauth_auth: auth}}  = conn  ,params) do
        user_params = %{email: auth.info.email, token: auth.credentials.token, provide: auth.provider}
        changeset = User.changeset(%User{}, user_params)

        signIn(conn, changeset)


    end 

    defp signIn(conn, changeset) do
        case exists? changeset do
            {:ok, user} -> conn |> redirect(to: topic_path(conn, :index))
            {:error, changeset} -> render 
        end
    end


    defp exists?(changeset) do
        case Repo.get_by(User, email: changeset.changes.email) do
            nil -> Repo.insert(User, changeset)
            user -> {:ok, user} 
        end
    end
end