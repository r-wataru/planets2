class CreateIndividualCompetences < ActiveRecord::Migration
  def change
    create_table :individual_competences do |t|
      t.references :user, null: false
      t.boolean :pitcher, null: false, default: false
      t.boolean :catcher, null: false, default: false
      t.boolean :first, null: false, default: false
      t.boolean :second, null: false, default: false
      t.boolean :short, null: false, default: false
      t.boolean :third, null: false, default: false
      t.boolean :outfield, null: false, default: false
      t.integer :line, null: false, default: 0
      t.integer :meet, null: false, default: 0
      t.integer :power, null: false, default: 0
      t.integer :running_ability, null: false, default: 0
      t.integer :shoulder_power, null: false, default: 0
      t.integer :defense, null: false, default: 0
      t.integer :speed, null: false, default: 0
      t.integer :controll, null: false, default: 0
      t.integer :stamina, null: false, default: 0
      t.integer :throw, null: false, default: 0
      t.integer :swing, null: false, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
