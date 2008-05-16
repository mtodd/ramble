class PostMigration < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      varchar :title
      text :body
      datetime :created_at
      datetime :updated_at
    end
  end
  def down
    drop_table :posts
  end
end
