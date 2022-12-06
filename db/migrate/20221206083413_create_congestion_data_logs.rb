class CreateCongestionDataLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :congestion_data_logs do |t|
      t.integer :number_of_people
      t.float :density
      t.string :place_name

      t.timestamps
    end
  end
end
