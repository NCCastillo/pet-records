require "rails_helper"

describe VeterinariansController, type: :controller do
  describe "GET #new" do
    it "sets instance variable to be an instance of Veterinarian" do
      get :new

      expect(assigns[:veterinarian]).to be_a_new Veterinarian
    end

    it "renders new template" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "it redirects to index page", focus: true do
        post :create, veterinarian: { organization_name: "The Animal Hospital" }

        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "re renders the form" do
        post :create, veterinarian: { organization_name: nil }

        expect(response).to render_template(:new)
      end
    end
  end
end
