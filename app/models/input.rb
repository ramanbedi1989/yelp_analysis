class Input < ActiveRecord::Base
	validates :url, presence: true
end
