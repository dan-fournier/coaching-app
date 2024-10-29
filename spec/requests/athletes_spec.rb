require 'rails_helper'

RSpec.describe "Athletes", type: :request do
  describe "GET /athletes" do
    it "renders the athletes index page" do
      get athletes_path
      expect(response).to have_http_status(:success)
    end
  end
end
