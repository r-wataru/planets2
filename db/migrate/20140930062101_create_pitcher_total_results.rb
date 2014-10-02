class CreatePitcherTotalResults < ActiveRecord::Migration
  def change
    create_table :pitcher_total_results do |t|
      t.references :user, null: false
      t.references :season, null: false
      t.integer :pitching_number, null: false, default: 0
      t.integer :hit, null: false, default: 0
      t.integer :run, null: false, default: 0
      t.integer :remorse_point, null: false, default: 0
      t.integer :strikeouts, null: false, default: 0
      t.integer :winning, null: false, default: 0
      t.integer :defeat, null: false, default: 0
      t.integer :hold_number, null: false, default: 0
      t.integer :save_number, null: false, default: 0
      t.string :winning_rate, null: false, default: ""
      t.string :struck_out_rate, null: false, default: ""
      t.string :earned_run_average, null: false, default: ""
      t.text :set_games
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :pitcher_total_results, :user_id
  end
end
