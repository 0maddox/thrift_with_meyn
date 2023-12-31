class CreateJwtDenylists < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_denylists do |t|
      t.string :jti, null: false, default: ''
      t.string :token, index: { unique: true }
      t.datetime :exp, null: false

      t.timestamps
    end
    add_index :jwt_denylists, :jti, unique: true
    
  end
end
