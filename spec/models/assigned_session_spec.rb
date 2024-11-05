require 'rails_helper'

RSpec.describe AssignedSession, type: :model do
  let(:athlete) { create(:athlete) }
  let(:assigned_session) { create(:assigned_session, athlete: athlete) }

  describe "validations" do
    it "is valid with valid attributes" do
      valid_attributes = {
        date: Date.new(2024, 2, 3),
        details: "60 minute easy run",
        session_type: :easy_run,
        athlete: athlete
      }

      assigned_session = AssignedSession.new(valid_attributes)
      expect(assigned_session).to be_valid
    end

    it "is invalid when date is not present" do
      assigned_session.date = nil
      expect(assigned_session).not_to be_valid
    end

    it "is invalid when details is not present" do
      assigned_session.details = nil
      expect(assigned_session).not_to be_valid
    end

    it "is invalid when session_type is not present" do
      assigned_session.session_type = nil
      expect(assigned_session).not_to be_valid
    end
  end

  describe 'enum session_type' do
    it 'returns the correct session type' do
      assigned_session.session_type = :long_run
      expect(assigned_session.long_run?).to be_truthy
    end

    it 'raises an error for an invalid enum value' do
      expect { assigned_session.session_type = 'invalid_type' }.to raise_error(ArgumentError)
    end
  end

  describe "associations" do
    it "belongs to an athlete" do
      assoc = AssignedSession.reflect_on_association(:athlete).macro
      expect(assoc).to eq(:belongs_to)
    end
  end
end
