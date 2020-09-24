class Company < ActiveRecord::Base
  validates :name, :full_name, :inn, :orgn, :kind_of_action, :location, presence: true
  validates :inn,  length: {in: 10..10}
  validates :orgn,  length: {in: 13..13}
  validates :number_id,  length: {in: 4..4}
end
