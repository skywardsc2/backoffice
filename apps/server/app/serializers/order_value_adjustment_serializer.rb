# == Schema Information
#
# Table name: order_value_adjustments
#
#  id                :bigint           not null, primary key
#  description       :text
#  value_cents       :bigint
#  value_currency    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  customer_order_id :bigint
#
class OrderValueAdjustmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :value_cents, :value_currency
end
