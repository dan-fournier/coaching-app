require 'rails_helper'

RSpec.describe Athlete, type: :model do
  it "is valid with valid params" do
    valid_params = {
      first_name: "John",
      last_name: "Doe",
      email: "test@email.com"
    }
    athlete = Athlete.new(valid_params)
    expect(athlete).to be_valid
  end

  describe "#full_name" do
    it 'returns the full name of the athlete' do
      athlete = Athlete.new(first_name: 'John', last_name: 'Doe')
      expect(athlete.full_name).to eq('John Doe')
    end
  end

  describe "validations" do
    it "is invalid when first_name is not present" do
      athlete = Athlete.new(first_name: nil, last_name: "Doe", email: "test@email.com")
      expect(athlete).not_to be_valid
    end

    it "is invalid when last_name is not present" do
      athlete = Athlete.new(first_name: "John", last_name: nil, email: "test@email.com")
      expect(athlete).not_to be_valid
    end

    it "is invalid when email is not present" do
      athlete = Athlete.new(first_name: "John", last_name: "Doe", email: nil)
      expect(athlete).not_to be_valid
    end
  end

  describe "associations" do
    it "has many assigned sessions" do
      assoc = Athlete.reflect_on_association(:assigned_sessions).macro
      expect(assoc).to eq(:has_many)
    end
  end
end
