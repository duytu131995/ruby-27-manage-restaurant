# require 'rails_helper'

# RSpec.describe OrderItem, type: :model do
#   let!(:order_items) {FactoryBot.create :order_item, unit_price: 150, quantity: 3}

#   describe "Associations" do
#     it {expect(order_items).to belong_to(:order)}
#     it {expect(order_items).to belong_to(:dish)}
#   end

#   describe "#unit_price" do
#     subject{order_items.send(:unit_price)}

#     it "correct unit price" do
#       is_expected.to eq(150)
#     end

#     it "incorrect unit price" do
#       is_expected.not_to eq(10000)
#     end
#   end

#   describe "#total_price" do
#     subject{order_items.total_price}

#     it "correct unit price" do
#       is_expected.to eq(450)
#     end

#     it "incorrect unit price" do
#       is_expected.not_to eq(10000)
#   end
# end
