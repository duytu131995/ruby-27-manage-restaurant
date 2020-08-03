# require "rails_helper"

# RSpec.describe Admin::DishesController, type: :controller do
#   let!(:dish_type){FactoryBot.create :dish_type}
#   let!(:dish){FactoryBot.create :dish}
#   let!(:user) {FactoryBot.create :user}

#   context "when admin login" do
#     before {login user}

#     describe "GET #index" do
#       before {get :index}

#       it "should render view index" do
#         expect(response).to render_template :index
#       end

#       it "should assign @dishes to the view" do
#         expect(assigns(:dishes)).to eq([dish])
#       end
#     end

#     describe "GET #new" do
#       before{get :new}

#       it "should render view new" do
#         expect(response).to render_template :new
#       end

#       it "should assign @dish" do
#         expect(assigns(:dish).new_record?).to be true
#       end
#     end

#     describe "POST #create" do
#       let(:params) do
#         {dish: FactoryBot.attributes_for(:dish, dish_type_id: dish.dish_type_id)}
#       end

#       context "when valid params" do
#         before do
#           post :create, params: params
#         end

#         it "create a new dish success" do
#           expect {post :create, params: params}.to change(Dish, :count).by(1)
#         end

#         it "should create new dish" do
#           expect(flash[:success]).to eq I18n.t("dish_types.create_success")
#         end
#       end

#       context "when invalid params" do
#         before do
#           post :create, params: {dish: {name: "invalid name"}}
#         end

#         it "should render view new" do
#           expect(response).to render_template :new
#         end

#         it "should return error message" do
#           expect(flash[:danger]).to eq I18n.t("dish_types.create_error")
#         end
#       end
#     end

#     describe "GET #edit" do
#       context "find dish" do
#         let(:params){{id: dish.id}}

#         before {get :edit, params: {id: dish.id}}

#         it "should render view edit" do
#           expect(response).to render_template :edit
#         end

#         it "should return status" do
#           expect(response).to have_http_status 200
#         end

#         it "should return dish" do
#           expect(assigns(:dish)).to eq dish
#         end
#       end

#       context "dish not found" do
#         before {get :edit, params: {id: "id_fail"}}

#         it "load dish fail" do
#           expect(flash[:danger]).to match(I18n.t("dish_types.not_found"))
#         end
#       end
#     end

#     describe "PATCH #update" do
#       context "when valid params" do
#         before do
#           patch :update, params: {id: dish.id, dish: {name: "New name"}}
#           dish.reload
#         end

#         it "should save dish" do
#           expect(dish.persisted?).to be true
#         end

#         it "should update dish" do
#           expect(flash[:success]).to eq I18n.t("dishes.update_success")
#         end
#       end

#       context "when invalid params" do
#         before do
#           patch :update, params: {id: "id_fail", dish: {name: "New name"}}
#         end

#         it "should return error message" do
#           expect(flash[:danger]).to eq I18n.t("dish_types.not_found")
#         end
#       end
#     end

#     describe "DELETE #destroy" do
#       let(:params) do
#         {id: dish.id, dish: FactoryBot.attributes_for(:dish, dish_type_id: dish_type.id)}
#       end

#       before do
#         delete :destroy, params: params
#       end

#       context "when valid params" do
#         it "should destroy dish" do
#           expect(Dish.exists? dish.id).to eq false
#         end

#         it "should redirect to dishes index" do
#           expect(response).to redirect_to admin_dishes_path
#         end

#         it "should return with success message" do
#           expect(flash[:success]).to eq I18n.t("dish_types.delete_success")
#         end
#       end

#       context "when invalid params" do
#         let(:params) do
#           {id: "id_fail", dish: FactoryBot.attributes_for(:dish, dish_type_id: dish_type.id)}
#         end

#         it "should redirect to dishes index" do
#           expect(response).to redirect_to admin_dishes_path
#         end

#         it "should return with error message" do
#           expect(flash[:danger]).to eq I18n.t("dish_types.not_found")
#         end
#       end
#     end
#   end
# end
