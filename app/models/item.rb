class Item < ActiveRecord::Base

  # Statuses
  ACTIVE_STATUS = 'active'
  INACTIVE_STATUS = 'inactive'
  AUTHORIZED_STATUSES = [ ACTIVE_STATUS ]
  UNAUTHORIZED_STATUSES = [ INACTIVE_STATUS ]
  ALL_STATUSES = AUTHORIZED_STATUSES + UNAUTHORIZED_STATUSES

  # Callbacks

  # Other
  LETTERS_DIGITS_WHITESPACE = /\A[A-Za-z\d\s]*\z/i
  ONLY_LETTERS = /\A[A-Za-z]*\z/i
  ONLY_DIGITS = /\A\d{4}\z/i

  # Validations
  validates :status, presence: true, inclusion: { in: ALL_STATUSES, message: '%{value} is not a valid status' }
  validates :name, format: { with: LETTERS_DIGITS_WHITESPACE }
  validates :description,
             format: { with: LETTERS_DIGITS_WHITESPACE },
             length: { maximum: 500 }
  
  # Relations
  has_many :prices, dependent: :destroy

  # Scopes

  # Instance Methods
  
  # Class Methods

end
