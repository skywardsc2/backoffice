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
class OrderLineSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price_cents, :unit_price_currency, :product_id
  belongs_to :product
end
