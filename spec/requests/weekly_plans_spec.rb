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
end
