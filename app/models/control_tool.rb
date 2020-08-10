class ControlTool < ActiveRecord::Base
  belongs_to :workpoint
  validates :workpoint, presence: true
end
