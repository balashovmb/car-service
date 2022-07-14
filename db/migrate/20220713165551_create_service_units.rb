class CreateServiceUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :service_units do |t|
      t.string :name, null: false, unique: true
      t.references :service_category, null: false

      t.timestamps
    end
  end
end
