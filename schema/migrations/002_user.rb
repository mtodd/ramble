class UserMigration < Sequel::Migration
  def up
    create_table :users do
      varchar :username, :primary => true, :unique => true, :size => 32
      varchar :name
      varchar :password, :size => 32
      varchar :email
    end
  end
  def down
    drop_table :users
  end
end
