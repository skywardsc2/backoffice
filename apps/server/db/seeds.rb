# This file creates sample data for testing the order management feature
# Run it with: rails db:seed
require 'faker'

# Clear existing data
puts "Cleaning database..."
CustomerOrder.destroy_all
Customer.destroy_all
Organization.destroy_all
Product.destroy_all

# Create Organizations
puts "Creating organizations..."
3.times do
  Organization.create!(
    name: Faker::Company.name,
    cnpj: Faker::Company.brazilian_company_number,
    email: Faker::Internet.email
  )
end

# Create Products
puts "Creating products..."
10.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    default_unit_price_cents: Faker::Commerce.price(range: 1000..50000).to_i,
    default_unit_price_currency: 'BRL'
  )
end

# Create Customers
puts "Creating customers..."
5.times do
  Customer.create!(
    email: Faker::Internet.email
  )
end

# Create Orders
puts "Creating orders..."
10.times do
  order = CustomerOrder.create!(
    organization: Organization.all.sample,
    customer: Customer.all.sample,
    status: ['draft', 'pending', 'processing', 'completed', 'cancelled'].sample
  )

  # Create Order Lines
  rand(1..5).times do
    product = Product.all.sample
    OrderLine.create!(
      customer_order: order,
      product: product,
      quantity: rand(1..10),
      unit_price_cents: product.default_unit_price_cents,
      unit_price_currency: 'BRL'
    )
  end

  # Occasionally add adjustments
  if rand < 0.3
    OrderValueAdjustment.create!(
      customer_order: order,
      description: ['Discount', 'Shipping fee', 'Special handling'].sample,
      value_cents: Faker::Commerce.price(range: -5000..5000).to_i,
      value_currency: 'BRL'
    )
  end
end

puts "Seed completed! Created:"
puts "- #{Organization.count} organizations"
puts "- #{Product.count} products"
puts "- #{Customer.count} customers"
puts "- #{CustomerOrder.count} orders"
puts "- #{OrderLine.count} order lines"
puts "- #{OrderValueAdjustment.count} order adjustments"
