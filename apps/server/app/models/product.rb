# == Schema Information
#
# Table name: products
#
#  id                          :bigint           not null, primary key
#  default_unit_price_cents    :bigint
#  default_unit_price_currency :string
#  name                        :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class Product < ApplicationRecord
  monetize :default_unit_price_cents, with_model_currency: :default_unit_price_currency
end
