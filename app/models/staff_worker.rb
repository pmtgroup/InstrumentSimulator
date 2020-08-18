class StaffWorker < ActiveRecord::Base
  belongs_to :subdivision
  belongs_to :workplace
  belongs_to :additional_workplace, class_name: "Workplace"
  def full_name
    "#{surname} #{name} #{patronymic}"
  end
end
