class Story < ActiveRecord::Base
  attr_accessible :descr, :responsible, :state

  belongs_to :user

  validates_presence_of :descr, on: :create
  validates_presence_of :responsible, on: :create

  state_machine :state, initial: :new do

    event :start do
      transition new: :started
    end

    event :finish do
      transition started: :finished
    end

    event :deliver do
      transition finished: :delivered
    end

    event :accept do
      transition delivered: :accepted
    end

    event :reject do
      transition delivered: :rejected
    end

    event :restart do
      transition rejected: :started
    end
  end
end
