class LocalVibFIndicator < ActiveRecord::Base
  belongs_to :staff_worker
  belongs_to :working_operation
end
