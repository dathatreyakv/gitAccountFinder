class GitAccount < ApplicationRecord
	has_many :repositories
end
