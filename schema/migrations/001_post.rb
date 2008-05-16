# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://code.google.com/p/ruby-sequel/wiki/Migrations

class PostMigration < Sequel::Migration

  def up
    create_table :posts do
      datetime :updated_at
      text :body
      string :title
      datetime :created_at
    end
  end

  def down
      end

end
