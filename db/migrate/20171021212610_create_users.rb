class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
      t.index :email, unique: true
      t.index :password_digest, unique: true
    end
  end
end
