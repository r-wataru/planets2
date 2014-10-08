class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :login_name, null: false
      t.string :hashed_password
      t.boolean :super_user, null: false, default: false

      t.timestamps
    end
  end
end
