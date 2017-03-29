class Url < ApplicationRecord
	belongs_to :notification
	has_many :reports
end
