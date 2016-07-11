class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :year
      t.string :month
      t.string :day
      t.string :time
      t.string :about

      t.timestamps null: false
    end
  end
end
