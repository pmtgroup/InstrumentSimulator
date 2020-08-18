class Subdivision < ActiveRecord::Base
  belongs_to :company
  validates :name, :full_name, :company, presence: true
end
