require 'rspec'
require 'date'
require_relative '../lib/reqs'


describe CongressMember, "stuff" do
  it 'should have many attriburtes' do
    test_member = CongressMember.all.sample
     [:title,
     :firstname,
     :lastname,
     :party,
     :state,
     :in_office,
     :gender,
     :phone,
     :fax,
     :website,
     :webform,
     :twitter_id,
     :tweets,
     :birthdate,
     :type].each { |mthd| test_member.should respond_to mthd }
  end

  it 'should retrieve tweets' do
    test_member = CongressMember.all.reject{|cm| cm.twitter_id.nil?}.sample
    test_member.fetch_tweets
    test_member.print_tweets
  end
  # it "should be the right age" do
  #   now = Date.today
  #   age = now.year - @student.birthday.year - ((now.month > @student.birthday.month || (now.month == @student.birthday.month && now.day >= @student.birthday.day)) ? 0 : 1)
  #   @student.age.should == age
  # end

end

# describe Student, "validations" do

#   before(:all) do
#     raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students).should be_true
#     Student.delete_all
#   end

#   before(:each) do
#     @student = Student.new
#     @student.assign_attributes(
#       :first_name => "Kreay",
#       :last_name => "Shawn",
#       :birthday => Date.new(1989,9,24),
#       :gender => 'female',
#       :email => 'kreayshawn@oaklandhiphop.net',
#       :phone => '(510) 555-1212 x4567'
#     )
#   end

#   it "should accept valid info" do
#     @student.should be_valid
#   end

#   it "shouldn't accept invalid emails" do
#     ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
#       @student.assign_attributes(:email => address)
#       @student.should_not be_valid
#     end
#   end

#   it "should accept valid emails" do
#     ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
#       @student.assign_attributes(:email => address)
#       @student.should be_valid
#     end
#   end

#   it "shouldn't accept toddlers" do
#     @student.assign_attributes(:birthday => Date.today - 3.years)
#     @student.should_not be_valid
#   end

#   it "shouldn't allow two students with the same email" do
#     another_student = Student.create!(
#       :birthday => @student.birthday,
#       :email => @student.email,
#       :phone => @student.phone
#     )
#     @student.should_not be_valid
#   end

# end

# describe Student, "advanced validations" do

#   before(:all) do
#     raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students).should be_true
#     Student.delete_all
#   end

#   before(:each) do
#     @student = Student.new
#     @student.assign_attributes(
#       :first_name => "Kreay",
#       :last_name => "Shawn",
#       :birthday => Date.new(1989,9,24),
#       :gender => 'female',
#       :email => 'kreayshawn@oaklandhiphop.net',
#       :phone => '(510) 555-1212 x4567'
#     )
#   end

#   it "should accept valid info" do
#     @student.should be_valid
#   end

#   it "shouldn't accept invalid phone numbers" do
#     @student.assign_attributes(:phone => '347-8901')
#     @student.should_not be_valid
#   end

# end
