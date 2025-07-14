class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.text :name
      t.bigint :default_unit_price_cents
      t.string :default_unit_price_currency

      t.timestamps
    end
  end
end
