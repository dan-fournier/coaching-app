require 'rails_helper'

RSpec.describe AssignedSession, type: :model do
  describe "associations" do
    it "belongs to an athlete" do
      assoc = AssignedSession.reflect_on_association(:athlete).macro
      expect(assoc).to eq(:belongs_to)
    end
  end
end
