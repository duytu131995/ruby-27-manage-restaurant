# require "rails_helper"

# RSpec.describe Order, type: :model do
#   let!(:user) {FactoryBot.create :user}
#   let!(:dinner_table) {FactoryBot.create :dinner_table}
#   let!(:order) {FactoryBot.create :order, user_id: user.id, dinner_table_id: dinner_table.id}

#   describe "Associations" do
#     it {expect(order).to belong_to :user}
#     it {expect(order).to belong_to :dinner_table}
#     it {expect(order).to have_many(:order_items).dependent(:destroy)}
#   end

#   describe "Enums" do
#     it {expect(order).to define_enum_for(:payment_method).with_values([:cash, :card])}
#     it {expect(order).to define_enum_for(:status).with_values([:processing, :complete])}
#   end

#   describe "Delegate" do
#     it {is_expected.to delegate_method(:name).to(:user).with_prefix(:user)}
#     it {is_expected.to delegate_method(:table_number).to(:dinner_table).with_prefix(:dinner_table)}
#   end

#   describe ".search_table_orders" do
#     it "matching dinner table" do
#       expect(Order.search_table_orders(dinner_table.id).first.dinner_table_id).to eq(dinner_table.id)
#     end
#   end
# end
