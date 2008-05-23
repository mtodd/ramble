# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://code.google.com/p/ruby-sequel/wiki/Migrations

class PageMigration < Sequel::Migration

  def up
    create_table :pages do
      string :slug
      datetime :updated_at
      string :title
      text :content
      datetime :created_at
    end
  end

  def down
    drop_table :pages
  end

end
