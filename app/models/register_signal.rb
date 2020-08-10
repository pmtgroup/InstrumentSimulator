class RegisterSignal < ActiveRecord::Base
  belongs_to :control_tool
  validates :control_tool, :number_register, presence: true
  validates :number_register,  length: {in: 8..8}
end
