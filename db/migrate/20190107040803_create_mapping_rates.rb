class CreateMappingRates < ActiveRecord::Migration[5.1]
  def change
    create_table :mapping_rates do |t|
      t.belongs_to :enumerations
      t.belongs_to :service_packs
      t.integer :units_per_hour
      t.timestamps
    end
  end
end
