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
class CustomerOrder < ApplicationRecord
  belongs_to :organization
  belongs_to :customer
  has_many :order_lines, dependent: :destroy
  has_many :order_value_adjustments, dependent: :destroy

  accepts_nested_attributes_for :order_lines, allow_destroy: true
  accepts_nested_attributes_for :order_value_adjustments, allow_destroy: true
end
