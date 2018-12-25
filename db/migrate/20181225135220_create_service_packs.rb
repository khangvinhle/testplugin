class CreateServicePacks < ActiveRecord::Migration[5.1]
  def change
    create_table :service_packs do |t|
      t.string :name
      t.integer :total_units
      t.integer :remain_units
      t.integer :duration # don vi tinh: month
      t.date :start_date
      t.date :expired_date
      t.integer :threshold1
      t.integer :threshold2
      t.timestamps
    end
  end
end
