class Violation < ActiveRecord::Base      
  belongs_to :event

  scope :status, -> (status) { where status: status }
  scope :approved, -> { where("approved = 't'") }
#scope :week, -> { where ("date_entered >= ?", Date.today) }
  scope :date_desc, -> { order(date_entered: :desc ) }



scope :time_span, -> time_span {
    puts "!!! -- " + time_span + " -----!!!!" 
# case |time_ago|
#   when "week"
#     where("date_entered >= :date", :date => 1.week.ago)
#   end
  }

  attr_accessible :lat, :lng, :date_entered, :date_closed, :description, 
  :status, :violation_address, :violation_type, :image_before, :image_after,:approved, :event

  attr_protected :id
  
  validates :date_entered, presence: true
  validates :description, presence: true

  has_attached_file :image_before, styles: {
    thumb: '150x120>',
    full: '1200x900>'
  }, :default_url => '/resources/images/missing_:style.png'

  has_attached_file :image_after, styles: {
    thumb: '150x120>',
    full: '1200x900>'
  }, :default_url => '/resources/images/after_missing_:style.png'

  validates_attachment :image_before,
   # :presence => false,
    :size => { :in => 0..8.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  validates_attachment :image_after,
   # :presence => false,
    :size => { :in => 0..8.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  def image_before_url_f
    image_before.url(:full)
  end

  def image_before_url_t
    if image_before.url(:thumb).chr == "/"
      img_path = image_before.url(:thumb)
      img_path.slice!(0)
      return img_path
    else
      return image_before.url(:thumb)
    end
  end

  def image_after_url_f
    image_after.url(:full)
  end

  def image_after_url_t
    image_after.url(:thumb)
  end

  def pretty_type
    if violation_type == "bigitem"
      "Big Item"
    else
      violation_type
    end
  end

end
