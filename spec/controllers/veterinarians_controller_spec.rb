require "rails_helper"

describe VeterinariansController, type: :controller do
  describe "GET #new" do
    it "sets instance variable to be an instance of Veterinarian" do
      get :new

      expect(assigns[:veterinarian]).to be_a_new Veterinarian
    end

    it "renders new template" do
      get :new

      expect(response).to render_template :new
    end
  end
end
