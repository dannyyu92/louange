class Price < ActiveRecord::Base

  # Callbacks

  # Validations
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  
  # Relations
  belongs_to :user
  belongs_to :item

  # Scopes

  # Instance Methods

  # Class Methods

end
