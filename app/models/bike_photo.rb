class BikePhoto < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :bike

	has_attached_file :image, styles: { xl: "800*800>",large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

end
