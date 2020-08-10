class Workpoint < ActiveRecord::Base
  belongs_to :workplace
  mount_uploader :description_file, DescriptionUploader
  validates :name, :description, :type_vpf, :workplace, presence: true
end
