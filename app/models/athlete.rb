class Athlete < ApplicationRecord
  has_many :assigned_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end
end
