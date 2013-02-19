class Pin < ActiveRecord::Base
  attr_accessible :description, :image
	
	validates :description, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  										 :content_type => { content_type: ['image/jpeg', 'image/jpg'] },
 											 size: { less_than: 1.megabytes }
  
  belongs_to :user
  has_attached_file :image, #styles: { medium: "200x200>" },
  									:path => ":rails_root/app/assets/images/:attachment/:id/:filename",
      							:url => "/app/assets/images/:id/:filename"
end
