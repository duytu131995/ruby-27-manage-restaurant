# require "rails_helper"

# RSpec.describe OrderItem, type: :model do
#   let!(:order) {FactoryBot.create :order}
#   let!(:dish) {FactoryBot.create :dish}
#   let!(:order_item) {FactoryBot.create :order_item, order_id: order.id, dish_id: dish.id}

#   describe "Associations" do
#     it {expect(order_item).to belong_to :order}
#     it {expect(order_item).to belong_to :dish}
#   end

#   describe "Enums" do
#     it {expect(order_item).to define_enum_for(:status).with_values([:pending, :success])}
#   end

#   describe ".load_items" do
#     it "matching order" do
#       expect(OrderItem.load_items(order.id).first.order_id).to eq(order.id)
#     end
#   end
# end
