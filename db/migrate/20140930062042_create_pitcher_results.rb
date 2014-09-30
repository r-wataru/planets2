class CreatePitcherResults < ActiveRecord::Migration
  def change
    create_table :pitcher_results do |t|
      t.references :user, null: false
      t.references :game, null: false
      t.integer :pitching_number, null: false, default: 0
      t.integer :hit, null: false, default: 0
      t.integer :run, null: false, default: 0
      t.integer :remorse_point, null: false, default: 0
      t.integer :strikeouts, null: false, default: 0
      t.integer :winning, null: false, default: 0
      t.integer :defeat, null: false, default: 0
      t.integer :hold_number, null: false, default: 0
      t.integer :save_number, null: false, default: 0
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :pitcher_results, :user_id
  end
end
