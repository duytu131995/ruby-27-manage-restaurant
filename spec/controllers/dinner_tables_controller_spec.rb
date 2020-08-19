require "rails_helper"

RSpec.describe DinnerTablesController, type: :controller do
  include_examples "Dinner tables"

  describe "GET #index" do
    include_examples "Action status"

    before{get :index}

    it "response to html by default" do
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end

    it "render the index template" do
      is_expected.to render_template :index
    end

    it "response to body" do
      expect(response.body).to eq ""
    end

    it "assigns dinner_tables to the index" do
      expect(assigns(:dinner_tables)).to eq([dinner_table])
    end
  end

  describe "GET #show" do
    before{get :show, params: {id: dinner_table.id}}

    include_examples "Action status"

    it "render the show template" do
      is_expected.to render_template :show
    end

    it "response to html by default" do
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end

    it "response to body" do
      expect(response.body).to eq ""
    end
  end

  describe "PATCH #update" do
    context "when update values successfully!" do
      before{patch :update, params: {id: dinner_table.id, dinner_table: {status: "free", table_number: 1}}}

      it "redirect to index" do
        expect(response).to redirect_to admin_table_manage_index_path
      end

      it "show notification" do
        expect(flash[:success]).to eq I18n.t("dinner_tables.update.success")
      end

      it "responds to html by default" do
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end

      it "has a 302 status code" do
        expect(response.status).to eq 302
      end

      it "action cable sever broadcasted" do
        expect{ActionCable.server.broadcast "status_dinner_table_channel", id: 1,
        status: "free", name: 1}.to have_broadcasted_to("status_dinner_table_channel").with(id: 1,
        status: "free", name: 1)
      end
    end

    context "when update values fail!" do
      before{patch :update, params: {id: "123qwe", dinner_table: {status: "free", table_number: "qwe"}}}

      it "redirect admin_table_manage_path" do
        is_expected.to redirect_to admin_table_manage_path
      end

      it "show notification" do
        expect(flash[:danger]).to eq I18n.t("dinner_tables.find_dinner_table.danger")
      end
    end
  end
end
