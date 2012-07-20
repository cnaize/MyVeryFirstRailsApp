class Comment < ActiveRecord::Base
  attr_accessible :descr

  belongs_to :story

  validates_presence_of :descr, on: :create
end
