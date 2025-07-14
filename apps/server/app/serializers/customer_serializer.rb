# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  email           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address_id      :bigint
#  company_id      :bigint
#  person_id       :bigint
#  phone_number_id :bigint
#
class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :person_id, :company_id
end
