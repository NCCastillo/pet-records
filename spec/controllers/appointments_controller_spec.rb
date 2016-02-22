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

  describe "POST #create" do
    context "with valid attribute" do
      it "creates an appointment" do
        valid_attributes = attributes(description: "This is a description")

        expect do
          post :create, appointment: valid_attributes
        end.to change { Appointment.count }.by(1)
      end

      it "redirects to root" do
        valid_attributes = attributes(description: "This is a description")

        post :create, appointment: valid_attributes

        expect(response).to redirect_to root_path
      end
    end
  end

  context "with invalid attributes" do
    it "renders new template" do
      invalid_attributes = attributes(description: nil)

      post :create, appointment: invalid_attributes

      expect(response).to render_template :new
    end
  end

  def attributes(description:)
    {
      description: description,
      "appointment_schedule(1i)": 2016,
      "appointment_schedule(2i)": 2,
      "appointment_schedule(3i)": 3,
      "appointment_schedule(4i)": 13,
      "appointment_schedule(5i)": 02
    }
  end
end
