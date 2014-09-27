class User < ActiveRecord::Base
  authenticates_with_sorcery!

  # Statuses
  ACTIVE_STATUS = 'active'
  BANNED_STATUS = 'banned'
  TERMINATED_STATUS = 'terminated'
  AUTHORIZED_STATUSES = [ ACTIVE_STATUS ]
  UNAUTHORIZED_STATUSES = [ BANNED_STATUS, TERMINATED_STATUS ]
  ALL_STATUSES = AUTHORIZED_STATUSES + UNAUTHORIZED_STATUSES

  # Other
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validations
  validates :status, presence: true, inclusion: { in: ALL_STATUSES, message: '%{value} is not a valid status' }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  # Relations
  has_many :prices
  has_many :items
end
