class CreateCongestionData < ActiveRecord::Migration[7.0]
  def change
    create_table :congestion_data do |t|
      t.integer :number_of_people
      t.float :density
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
