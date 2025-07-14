class CreateOrderValueAdjustments < ActiveRecord::Migration[8.0]
  def change
    create_table :order_value_adjustments do |t|
      t.text :description
      t.bigint :value_cents
      t.string :value_currency
      t.bigint :customer_order_id

      t.timestamps
    end
  end
end
