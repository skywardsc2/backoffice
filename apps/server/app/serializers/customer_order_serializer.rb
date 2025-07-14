# == Schema Information
#
# Table name: customer_orders
#
#  id                      :bigint           not null, primary key
#  estimated_delivery_date :bigint
#  note                    :text
#  payment_method          :string
#  status                  :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  customer_id             :bigint
#  organization_id         :bigint
#
class CustomerOrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :estimated_delivery_date, :payment_method, :note
  belongs_to :customer
  belongs_to :organization
  has_many :order_lines
  has_many :order_value_adjustments
end
