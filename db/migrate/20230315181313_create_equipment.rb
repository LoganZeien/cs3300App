class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.text :description
      t.text :location
      t.string :SN
      t.string :MN
      t.datetime :lastpm

      t.timestamps
    end
  end
end
