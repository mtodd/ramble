class PostIntroMigration < Sequel::Migration
  def up
    add_column :posts, :intro, :text
  end
  def down
    drop_column :posts, :intro
  end
end
