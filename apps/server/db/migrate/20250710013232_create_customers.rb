class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.text :email
      t.bigint :person_id
      t.bigint :company_id
      t.bigint :address_id
      t.bigint :phone_number_id

      t.timestamps
    end
  end
end
