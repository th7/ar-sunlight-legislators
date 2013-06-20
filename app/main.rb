require '../lib/reqs'

# 1
#Given any state, first print out the senators for that state (sorted by last name) 
#then print out the representatives (also sorted by last name). 
#Include the party affiliation next to the name.
STATE = 'MN'

senators = CongressMember.where({:state => STATE, :title => 'Sen'})
reps = CongressMember.where({:state => STATE, :title => 'Rep'})

puts 'Senators:'
senators.sort{|a,b| a.lastname <=> b.lastname}.each do |sen|
  puts "#{sen.firstname} #{sen.lastname} (#{sen.party})"
end

puts 'Representatives:'
reps.sort{|a,b| a.lastname <=> b.lastname}.each do |rep|
  puts "#{rep.firstname} #{rep.lastname} (#{rep.party})"
end

# 2
# Given a gender, print out what number and percentage of the senators are of that gender 
# as well as what number and percentage of the representatives 
# being sure to include only those congresspeople who are actively in office

GENDER = 'F'

all_sen_in_office = CongressMember.where({:in_office => true, :title => 'Sen'})
all_sen_in_office_of_gender = all_sen_in_office.select{|s| s.gender == GENDER}

num_sen = all_sen_in_office.length
num_sen_gender = all_sen_in_office_of_gender.length

puts "#{GENDER} Senators: #{num_sen_gender} (#{(num_sen_gender.to_f / num_sen.to_f * 100).to_i}%)"

all_rep_in_office = CongressMember.where({:in_office => true, :title => 'Rep'})
all_rep_in_office_of_gender = all_rep_in_office.select{|s| s.gender == GENDER}

num_rep = all_rep_in_office.length
num_rep_gender = all_rep_in_office_of_gender.length

puts "#{GENDER} Representatives: #{num_rep_gender} (#{(num_rep_gender.to_f / num_rep.to_f * 100).to_i}%)"

# 3
# Print out the list of states along with how many active senators and representatives, 
# in descending order 

states = CongressMember.all.map{|c| c.state}.uniq
states_and_nums = states.map do |s| 
  [
    s, 
    CongressMember.where({:state => s, :title => 'Sen', :in_office => true}).length, 
    CongressMember.where({:state => s, :title => 'Rep', :in_office => true}).length
  ]
end
states_and_nums.sort!{|b,a| a[1]+a[2] <=> b[1]+b[2]}

states_and_nums.each do |s_a_n|
  puts "#{s_a_n[0]}: #{s_a_n[1]} Senators, #{s_a_n[2]} Representative(s)"
end

# 4
# For Senators and Representatives, count the total number of each 
# (regardless of whether or not they are actively in office).

puts "Senators: #{CongressMember.where({:title => 'Sen'}).length}"
puts "Representatives: #{CongressMember.where({:title => 'Rep'}).length}"

# 5
# Now use ActiveRecord to delete from your database any congresspeople 
# who are not actively in office, 
# then re-run your count to make sure that those rows were deleted

CongressMember.delete_all(["in_office = ?", false])
