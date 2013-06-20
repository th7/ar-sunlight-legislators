require 'rspec'
require 'date'
require_relative '../lib/reqs'

describe Tweet, "stuff" do
  it 'should have text and twitter_id attriburtes' do
    test_member = Tweet.all.sample
     [:text,
     :twitter_id
     ].each { |mthd| test_member.should respond_to mthd }
  end
end
