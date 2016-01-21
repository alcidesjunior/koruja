class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :last_name
      t.string :password
      t.integer :user_type, default: 0
      t.timestamps null: false
    end
  end
end
