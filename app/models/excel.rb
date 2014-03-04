class Excel < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end
