class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, :order => "id DESC"
  has_one :image, :class_name => 'BlogImage'
  
  def url
    str = '/' + title.gsub(/\ /,'_').downcase.dasherize 
    posted_on.strftime('/%Y/%m/%d') + str
  end
end
