class Bike < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
		new_record?
	end

	def score
		self.get_upvotes.size
	end

	acts_as_votable
	belongs_to :user

	validates :name, presence: true
	validates :description, length: {minimum: 6}, on: :create

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
