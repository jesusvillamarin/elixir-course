defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    alias Discuss.Topic # -> model, with an alias isn't write Discuss.Topic.functionsNames
    #Just using Topic.functionsNames

    def index(conn, _params) do
        topics = Repo.all(Topic);
        render conn, "index.html", topics: topics;
        
    end
    
    def new(conn, params) do
        changeset = Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end

    # Match to assign the params value to a variable named topic
    # This the same that %{"topic" => varTopic} = params
    def create(conn, %{"topic" => value }) do

        changeset = Topic.changeset(%Topic{}, value );
        
        case Repo.insert(changeset) do
            {:ok, _topic} -> 
                conn
                |> put_flash(:info, "Topic created Successfully :)")
                |> redirect(to: topic_path(conn, :index))
            {:error, changeset} -> render conn, "new.html", changeset: changeset
        end

    end

    def edit(conn, %{"id" => id}) do
        topic = Repo.get(Topic, id);
        changeset = Topic.changeset(topic)

        render conn, "edit.html", changeset: changeset, topic: topic
    end

    def update(conn, %{"id" => id,"topic" => topic}) do

        old_topic = Repo.get(Topic, id)
        changeset = Topic.changeset(old_topic, topic)
        
        case Repo.update(changeset) do
            {:ok, _topic} ->
                conn
                |> put_flash(:info, "Topic updated :D")
                |> redirect(to: topic_path(conn,:index))
            {:error, changeset} ->
                render conn, "edit.html", changeset: changeset, topic: old_topic
        end
    end

    def delete(conn, %{"id" => id}) do
        Repo.get!(Topic,id) |> Repo.delete!
        conn
        |> put_flash(:info, "Topic Deleted Successfully")
        |> redirect(to: topic_path(conn, :index))
    end
end