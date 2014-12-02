class User < ActiveRecord::Base
validates :password, length: {in: 6..9}

	has_many :posts
	has_many :comments
end
