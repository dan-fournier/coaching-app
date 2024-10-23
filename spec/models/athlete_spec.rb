require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe "validations" do
    context "first_name" do
      it "is valid when first_name is present" do
        athlete = Athlete.new(first_name: "John", last_name: "Doe")
        expect(athlete).to be_valid
      end
      it "is invalid when first_name is not present" do
        athlete = Athlete.new(first_name: nil, last_name: "Doe")
        expect(athlete).not_to be_valid
      end
    end

    context "last_name" do
      it "is valid when last_name is present" do
        athlete = Athlete.new(first_name: "John", last_name: "Doe")
        expect(athlete).to be_valid
      end
      it "is invalid when last_name is not present" do
        athlete = Athlete.new(first_name: "John", last_name: nil)
        expect(athlete).not_to be_valid
      end
    end
  end
end
