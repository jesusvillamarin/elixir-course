defmodule Discuss.Repo.Migrations.Topics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
    end

  end
end
