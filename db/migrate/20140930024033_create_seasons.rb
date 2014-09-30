class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :year, null: false
      t.string :name, null: false
      t.string :kind, null: false

      t.timestamps
    end
  end
end
