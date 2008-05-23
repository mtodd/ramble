class PageMigration < Sequel::Migration
  def up
    create_table :pages do
      primary_key :id
      varchar :title
      varchar :slug
      text :content
      datetime :created_at
      datetime :updated_at
    end
  end
  def down
    drop_table :pages
  end
end
