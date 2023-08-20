class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 20, unique: true
      t.string :email, null: false, limit: 50, unique: true
      t.string :password_digest, null: false
      t.string :role, default: "regular"
      t.boolean :admin, default: false
      t.string :profile_picture, default: ""
      
      t.timestamps
    end
  end
end
