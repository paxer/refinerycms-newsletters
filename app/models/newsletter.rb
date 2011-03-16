class Newsletter < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :email_from, :email_body]

  validates :title, :presence => true, :uniqueness => true
  validates :email_from, :email_body, :presence => true
  
end
