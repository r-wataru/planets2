class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :number
      t.string :display_name
      t.string :screen_name
      t.date :birthday
      t.integer :age
      t.datetime :logged_at
      t.text :description

      t.timestamps
    end
  end
end