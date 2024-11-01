class AssignedSession < ApplicationRecord
  belongs_to :athlete

  validates :date, presence: true
  validates :details, presence: true

  enum :session_type, {
    easy_run: 0,
    workout: 1,
    long_run: 2,
    rest_day: 3,
    cross_training: 4,
    strength: 5
  }
end
