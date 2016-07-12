class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :uid
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.timestamps null: false
    end
  end
end
