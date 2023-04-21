require "rails_helper"
# tells RSpec that we are testing the project controller, controller tests
RSpec.describe EquipmentController, :type => :controller do
    # Another describe, another grouping of all web request tests
    describe "test web requests, not logged in" do
        # Testing the index function on the controller to have a successful response (200 OK)
        context "GET #index" do
            it "returns a success response" do
                get :index
                expect(response).to have_http_status(:ok)
            end
        end
        # Testing the show function on the controller to have a successful response (200 OK)
        context "GET #show" do
            equipment = FactoryBot.create(:equipment)
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        # Testing the new function on the controller to have an unsuccessful response (302 OK), need authentication
        context "GET #new" do
            it "returns an unsuccessful response" do
                get :new
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(new_user_session_path)
            end
        end
        # Testing the edit function on the controller to have a unsuccessful response (302 OK)
        context "PATCH #edit" do
            equipment = FactoryBot.create(:equipment)
            it "returns an unsuccessful response" do
                get :edit, params: { id: equipment.id } # need to pass a parameter (id) to edit the project just made
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(new_user_session_path)
            end
        end
        # Testing the export function on the controller to have a successful response (302 OK)
        context "GET #export" do
            it "returns an unsuccessful response" do
                get :export
                expect(response).to have_http_status(200)
            end
        end
        # Testing the import function on the controller to have a unsuccessful response (302 OK)
        context "GET #import" do
            it "returns an unsuccessful response" do
                csv_file = fixture_file_upload("test_import.csv","text/csv")

                post :import, params: {file: csv_file}
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(new_user_session_path)
            end
        end
        # Testing the delete function on the controller to have a unsuccessful response (302 OK)
        context "DELETE #destroy" do
            equipment = FactoryBot.create(:equipment) # need a project to delete first
            it "returns an unsuccessful response" do
                delete :destroy, params: { id: equipment.id } # need to pass a parameter (id) to edit the project just made
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end

    describe "test web requests + logged in" do
        before(:each) do
            @user = FactoryBot.create(:user)
            sign_in @user
        end
        # Testing the new function on the controller to have an successful response (200 OK)
        context "GET #new" do
            it "returns a successful response" do
                get :new
                expect(response).to have_http_status(:ok)
            end
        end
        # Testing the edit function on the controller to have a successful response (200 OK)
        context "GET #edit" do
            equipment = FactoryBot.create(:equipment)
            it "returns a successful response" do
                get :edit, params: { id: equipment.id } # need to pass a parameter (id) to edit the project just made
                expect(response).to have_http_status(:ok)
            end
        end
        # Testing the delete function on the controller to have a successful response (302 redirected to the index page)
        context "DELETE #destroy" do
            equipment = FactoryBot.create(:equipment) # need a project to delete first
            it "returns a successful response" do
                delete :destroy, params: { id: equipment.id } # need to pass a parameter (id) to edit the project just made
                expect(response).to have_http_status(302) # redirected to index 
                expect(response).to redirect_to(equipment_index_path)
            end
        end
        # Testing the import function on the controller to have a successful response (200 OK)
        context "POST #import" do
            it "returns an unsuccessful response" do
                csv_file = fixture_file_upload("test_import.csv", 'text/csv')

                post :import, params: {file: csv_file}                
                expect(response).to have_http_status(204)
            end
        end
    end
end
