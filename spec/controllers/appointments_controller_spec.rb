require "rails_helper"

describe AppointmentsController, type: :controller do
  describe "GET #new" do
    it "sets appointment to be an intance of Appointment" do
      get :new

      expect(assigns[:appointment]).to be_a_new Appointment
    end

    it "renders new template" do
      get :new

      expect(response).to render_template :new
    end
  end
end
