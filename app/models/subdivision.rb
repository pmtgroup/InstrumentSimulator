class Subdivision < ActiveRecord::Base
  belongs_to :company
  validates :name, :full_name, :company, presence: true
  validates :number_id,  length: {in: 2..2}
end
