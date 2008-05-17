class UserMigration < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      varchar :username, :unique => true, :size => 32
      varchar :name
      varchar :password, :size => 32
      varchar :email
    end
  end
  def down
    drop_table :users
  end
end
