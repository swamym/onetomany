class Student < ActiveRecord::Base
	belongs_to :school
	has_one :photo
	accepts_nested_attributes_for :photo
end
