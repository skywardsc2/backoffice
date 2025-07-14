class CreateOrderLines < ActiveRecord::Migration[8.0]
  def change
    create_table :order_lines do |t|
      t.bigint :product_id
      t.bigint :quantity
      t.bigint :unit_price_cents
      t.string :unit_price_currency
      t.bigint :customer_order_id

      t.timestamps
    end
  end
end
