class CreateCustomerOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :customer_orders do |t|
      t.integer :status
      t.bigint :estimated_delivery_date
      t.string :payment_method
      t.bigint :organization_id
      t.bigint :customer_id
      t.text :note

      t.timestamps
    end
  end
end
