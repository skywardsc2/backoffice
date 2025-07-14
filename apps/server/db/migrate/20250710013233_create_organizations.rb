class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :cnpj
      t.text :email
      t.bigint :address_id
      t.bigint :phone_number_id

      t.timestamps
    end
  end
end
