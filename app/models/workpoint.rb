class Workpoint < ActiveRecord::Base
  belongs_to :workplace
  mount_uploader :description_file, DescriptionUploader
  validates :name, :description, :type_vpf, :workplace, presence: true
  validates :number_id,  length: {in: 2..2}
end
