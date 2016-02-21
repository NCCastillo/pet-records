require "rails_helper"

describe PetsController, type: :controller do
  describe "GET #new" do
    it "sets instance variable to be an instance of Pet" do
      get :new

      expect(assigns[:pet]).to be_a_new Pet
    end

    it "renders new template" do
      get :new

      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a pet" do
        expect do
          post :create, pet: { pet_name: "Lilo Castillo" }
        end.to change { Pet.count }.by(1)
      end

      it "redirects to root path" do
        post :create, pet: { pet_name: "Lilo Castillo" }

        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attribuets" do
      it "renders the new template" do
        post :create, pet: { pet_name: nil }

        expect(response).to render_template :new
      end
    end
  end
end
