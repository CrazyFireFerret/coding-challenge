class Post < ApplicationRecord
	has_many :comments, dependent: :destroy

	def self.search(search)
                where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
        end

end
