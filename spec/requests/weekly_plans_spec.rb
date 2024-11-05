require 'rails_helper'

RSpec.describe "WeeklyPlans", type: :request do
  let(:athlete) { create(:athlete) }
  describe "GET /athletes/:athlete_id/weekly_plans/new" do
    it "successfully renders the new weekly plan form" do
      get new_athlete_weekly_plan_path(athlete)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Add Weekly Plan")
    end
  end

  describe "POST /athletes/:athlete_id/weekly_plans" do
    context "with valid params" do
      let(:valid_params) do
        {
          athlete: {
            start_date: "2024-11-05",
            session_type_0: "easy_run", details_0: "Run 5 km",
            session_type_1: "easy_run", details_1: "Run 5 km",
            session_type_2: "workout", details_2: "10x400m intervals",
            session_type_3: "easy_run", details_3: "Run 5 km",
            session_type_4: "easy_run", details_4: "Run 5 km",
            session_type_5: "rest_day", details_5: "Rest day",
            session_type_6: "long_run", details_6: "Run 15 km"
          }
        }
      end
      it "creates seven new assigned sessions for an athlete" do
        expect {
          post athlete_weekly_plans_path(athlete), params: valid_params
      }.to change(AssignedSession, :count).by(7)
      end

      it "redirects to the athlete show page" do
        post athlete_weekly_plans_path(athlete), params: valid_params

        expect(response).to redirect_to athlete_path(athlete)

        follow_redirect!

        expect(response.body).to include("New weekly plan successfully created")
      end
    end

    context "with no start_date" do
      let(:invalid_params) do
        {
          athlete: {
            start_date: "",
            session_type_0: "easy_run", details_0: "Run 5 km",
            session_type_1: "easy_run", details_1: "Run 5 km",
            session_type_2: "workout", details_2: "10x400m intervals",
            session_type_3: "easy_run", details_3: "Run 5 km",
            session_type_4: "easy_run", details_4: "Run 5 km",
            session_type_5: "rest_day", details_5: "Rest day",
            session_type_6: "long_run", details_6: "Run 15 km"
          }
        }
      end

      it "does not create any new assigned sessions for an athlete" do
        expect {
          post athlete_weekly_plans_path(athlete), params: invalid_params
      }.to change(AssignedSession, :count).by(0)
      expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    context "with a session that is incomplete due to missing details" do
      let(:invalid_params) do
        {
          athlete: {
            start_date: "2024-10-28",
            session_type_0: "easy_run", details_0: "Run 5 km",
            session_type_1: "easy_run", details_1: "Run 5 km",
            session_type_2: "workout", details_2: "",
            session_type_3: "easy_run", details_3: "Run 5 km",
            session_type_4: "easy_run", details_4: "Run 5 km",
            session_type_5: "rest_day", details_5: "Rest day",
            session_type_6: "easy_run", details_6: "Run 5 km"
          }
        }
      end

      it "does not create any new assigned sessions for an athlete" do
        expect {
          post athlete_weekly_plans_path(athlete), params: invalid_params
      }.to change(AssignedSession, :count).by(0)
      end
    end
  end
end
