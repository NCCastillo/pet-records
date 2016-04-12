require "rails_helper"

describe VeterinariansController, type: :controller do
  describe "GET #new" do
    it "renders new template" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "it redirects to index page" do
        post :create, new_veterinarian_form: form_attributes

        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "re renders the form" do
        post :create, new_veterinarian_form: { organization_name: nil }

        expect(response).to render_template(:new)
      end
    end
  end

  def form_attributes
    FactoryGirl.attributes_for(:veterinarian).merge(FactoryGirl.attributes_for(:address))
  end
end
