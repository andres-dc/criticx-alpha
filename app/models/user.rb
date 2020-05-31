require 'time_difference'

class User < ApplicationRecord
  validates :username, :email, presence: true
  validate :check_user_age

  has_many :reviews

  has_secure_password

  private

  def check_user_age
    if birth_date.present? && TimeDifference.between(birth_date, DateTime.now).in_years <= 16
      errors.add(:birth_date, 'You must be at least 16 years old')
    end
  end
end
