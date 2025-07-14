# == Schema Information
#
# Table name: order_lines
#
#  id                  :bigint           not null, primary key
#  quantity            :bigint
#  unit_price_cents    :bigint
#  unit_price_currency :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  customer_order_id   :bigint
#  product_id          :bigint
#
class OrderLine < ApplicationRecord
  belongs_to :customer_order
  belongs_to :product

  monetize :unit_price_cents, with_model_currency: :unit_price_currency
end
