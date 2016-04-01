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
	has_many :comments, dependent: :destroy
	has_many :bike_photos, dependent: :destroy

	accepts_nested_attributes_for :bike_photos, reject_if: :reject_bike_photos

  def reject_bike_photos(attributed)
    attributed['image'].blank?
  end

	# accepts_nested_attributes_for :bike_photos, reject_if: lambda { |a| a[:image].blank? }, allow_destroy: true

	validates :name, presence: true
	validates :description, length: {minimum: 6}, on: :create
	validates :name, length: {maximum: 30}
	validates :image, presence: true

	has_attached_file :image, styles: { xl: "800*800>",large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes
  
end
