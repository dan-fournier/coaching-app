require 'rails_helper'

RSpec.describe "Athletes", type: :request do
  let(:athlete) { create(:athlete) }

  describe "GET /athletes" do
    it "renders the athletes index page" do
      get athletes_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /athletes/:id" do
    it "renders the athlete show page" do
      get athlete_path(athlete)
      expect(response).to have_http_status(:success)
    end
  end
end
