class PostAuthorsAndActiveFlagMigration < Sequel::Migration
  def up
    add_column :posts, :author_id, :integer, :null => false
    add_column :posts, :active, :boolean, :default => 1
  end
  def down
    drop_column :posts, :author_id
    drop_column :posts, :active
  end
end
