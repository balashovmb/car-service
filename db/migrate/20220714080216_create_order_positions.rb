class CreateOrderPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :order_positions do |t|
      t.references :executor, null: false, foreign_key: true
      t.references :service_unit, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
