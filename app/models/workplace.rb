class Workplace < ActiveRecord::Base
  belongs_to :subdivision
  validates  :type_vpf,:shift_duration, :number_of_shift, :subdivision, :name, presence: true
  validates :shift_duration, numericality: {greater_than_or_equal_to: 0 }
  validates :shift_duration, numericality: {less_than_or_equal_to: 24 }
  validates :number_of_shift, numericality: {greater_than_or_equal_to: 1 }
  validates :number_of_shift, numericality: {less_than_or_equal_to: 6 }
  validates :number_id,  length: {in: 2..2}
end
