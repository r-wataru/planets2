class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :season, null: false
      t.string :name, null: false
      t.text :description
      t.datetime :played_at, null: false
      t.string :total_result, null: false
      t.text :result1
      t.text :result2
      t.integer :plate_appearances, null: false, default: 0 # 打席数
      t.integer :at_bats, null: false, default: 0           # 打数
      t.integer :single, null: false, default: 0            # シングルヒット
      t.integer :double, null: false, default: 0            # ２ベース
      t.integer :triple, null: false, default: 0            # ３ベース
      t.integer :home_run, null: false, default: 0          # ホームラン
      t.integer :base_on_balls	, null: false, default: 0   # 四球
      t.integer :hit_by_pitches	, null: false, default: 0   # 死球
      t.integer :sacrifice_bunts, null: false, default: 0   # 犠打
      t.integer :sacrifice_flies, null: false, default: 0   # 犠飛
      t.integer :gaffe, null: false, default: 0             # 失策
      t.integer :infield_grounder, null: false, default: 0  # 内野ゴロ
      t.integer :outfield_grounder, null: false, default: 0 # 外野ゴロ
      t.integer :infield_fly, null: false, default: 0       # 内野フライ
      t.integer :outfield_fly, null: false, default: 0      # 外野フライ
      t.integer :infield_linera, null: false, default: 0    # 内野ライナー
      t.integer :out_linera, null: false, default: 0        # 外野ライナー
      t.integer :strikeouts, null: false, default: 0        # 三振
      t.integer :runs_batted_in, null: false, default: 0    # 打点
      t.integer :runs_scored, null: false, default: 0       # 得点
      t.integer :stolen_bases, null: false, default: 0      # 盗塁
      t.integer :pitching_number, null: false, default: 0   # 投球回
      t.integer :hit, null: false, default: 0               # 被安打
      t.integer :run, nul: false, default: 0                # 失点
      t.integer :get_strikeouts, null: false, default: 0    # 奪三振
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :games, :season_id
  end
end
