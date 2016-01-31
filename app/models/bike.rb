class Bike < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :description, length: {minimum: 6}, on: :create

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
