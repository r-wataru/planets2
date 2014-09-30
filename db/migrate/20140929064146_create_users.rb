class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :number
      t.string :display_name
      t.date :birthday
      t.integer :age
      t.datetime :logged_at
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
    
    add_index :users, :number, unique: true
  end
end