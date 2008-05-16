# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://code.google.com/p/ruby-sequel/wiki/Migrations

class UserMigration < Sequel::Migration

  def up
    create_table :users do
      string :username
      string :password
      string :email
    end
  end

  def down
      end

end
