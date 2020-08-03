# require "rails_helper"

# RSpec.describe Dish, type: :model do
#   let!(:dish_type){FactoryBot.create :dish_type}
#   let!(:dish){FactoryBot.create :dish}

#   describe "associations" do
#     it { should have_many(:order_item) }
#     it { should have_many(:images) }
#     it { should belong_to(:dish_type) }
#   end

#   describe "validations" do
#     it { should validate_presence_of(:name) }
#     it { should validate_numericality_of(:price) }
#   end

#   describe "enums" do
#     it {expect(dish).to define_enum_for(:status).with_values([:out_of_stock, :in_stock])}
#   end

#   describe "Scopes" do
#     describe "search" do
#       it "search by name" do
#         expect(Dish.search(dish.name).first.id).to eq(dish.id)
#       end

#       it "search by description" do
#         expect(Dish.search(dish.description).first.id).to eq(dish.id)
#       end
#     end

#     describe "fillter by price" do
#       it "between min_price and max_price" do
#         expect(Dish.fillter_by_price(10, 200).first.id).to eq(dish.id)
#       end
#     end
#   end
# end
