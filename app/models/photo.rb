class Photo < ActiveRecord::Base
	attr_accessible :avatar
	mount_uploader :avatar, AvatarUploader
	belongs_to :student
end
