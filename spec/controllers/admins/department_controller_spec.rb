# require "rails_helper"

# RSpec.describe Admin::DepartmentsController, type: :controller do
#   let!(:admin) {FactoryBot.create :user}
#   let!(:department) {FactoryBot.create :department}

#   context "when admin login" do
#     before {login admin}

#     describe "GET #index" do
#       before {get :index}

#       it "should render view index" do
#         expect(response).to render_template :index
#       end

#       it "should assign departments to the view" do
#         expect(assigns(:departments)).to eq([department])
#       end
#     end

#     describe "GET #new" do
#       before {get :new, xhr: true}

#       it "should render view new" do
#         expect(response).to render_template :new
#       end

#       it "should assign department" do
#         expect(assigns(:department).new_record?).to be true
#       end
#     end

#     describe "POST #create" do
#       subject{post :create, params: {department: FactoryBot.attributes_for(:department, name: "Lễ Tân", description: "Tiếp khách")}, format: :js}

#       context "when valid params" do
#         it "create a new department success" do
#           expect{subject}.to change(Department, :count).by(1)
#         end
#       end

#       context "when invalid params" do
#         it "render view new" do
#           post :create, params: {department: {name: "invalid name"}, format: :js}
#           expect(assigns(:department).persisted?).to be false
#         end
#       end
#     end

#     describe "GET #edit" do
#       context "find department render view edit template" do
#         it "should render view edit" do
#           get :edit, params: {id: department.id}, xhr: true
#           expect(response).to render_template :edit
#         end
#       end

#       context "not find department" do
#         it "redirect to admin_departments_path" do
#           get :edit, params: {id: "123qwe"}, xhr: true
#           expect(response).to redirect_to admin_departments_path
#         end
#       end
#     end

#     describe "PATCH #update" do
#       context "when valid params" do
#         it "should save department" do
#           patch :update, params: {id: department.id, department: {name: "Edit name"}}, format: :js
#           expect(department.persisted?).to be true
#         end
#       end

#       context "when invalid params" do
#         it "update fails and render view edit" do
#           patch :update, params: {id: "123qwe", department: {name: "Edit name"}}, format: :js
#           get :edit, params: {id: department.id}, xhr: true
#           expect(response).to render_template :edit
#         end
#       end
#     end

#     describe "DELETE #destroy" do
#       subject{post :destroy, params: {id: department.id, department: FactoryBot.attributes_for(:department, name: "Lễ Tân", description: "Tiếp khách"), format: :js}}

#       context "when valid params" do
#         it "delete a department success" do
#           expect{subject}.to change(Department, :count).by(-1)
#         end
#       end

#       context "when invalid params" do
#         it "delete a department fail" do
#           expect(subject).not_to eq(0)
#         end
#       end
#     end
#   end
# end
