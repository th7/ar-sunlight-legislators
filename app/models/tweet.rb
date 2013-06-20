

class Tweet < ActiveRecord::Base
  belongs_to :congress_member

  # def initialize(args)
  #   self.twitter_id = args[:id]
  #   super(args)
  # end
end
