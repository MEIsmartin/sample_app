class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  # this is advanced, but necessary for unique emails
  # because SQL is case insenstive
  before_save { |user| user.email = user.email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}\z/i

  # this will not work against a scenario where the same user clicks
  # a submit button twice in rapid succession.
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
