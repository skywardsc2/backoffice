# == Schema Information
#
# Table name: organizations
#
#  id              :bigint           not null, primary key
#  cnpj            :text
#  email           :text
#  name            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address_id      :bigint
#  phone_number_id :bigint
#
class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :cnpj, :email
end
