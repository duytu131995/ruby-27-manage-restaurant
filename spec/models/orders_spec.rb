# require "rails_helper"

# RSpec.describe Order, type: :model do
#   let!(:order) {FactoryBot.create :order, order_items: [FactoryBot.create(:order_item, quantity: 2, unit_price: 150)]}

#   describe "Associations" do
#     it {expect(order).to belong_to(:user)}
#     it {expect(order).to belong_to(:dinner_table)}
#     it {expect(order).to have_many(:order_items)}
#   end

#   describe "#subtotal" do
#     it "correct subtotal" do
#       expect(order.subtotal).to eq(300)
#     end

#     it "incorrect subtotal" do
#       expect(order.subtotal).not_to eq(110000)
#     end
#   end
# end
