class CreateCongressMembers < ActiveRecord::Migration
  def up
    create_table :congress_members do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :nickname
      t.string :party
      t.string :state
      t.string :district
      t.boolean :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id
      t.string :votesmart_id
      t.string :fec_id
      t.string :govtrack_id
      t.string :crp_id
      t.string :twitter_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
      t.date :birthdate
    end
  end

  def down
    drop_table :congress_members
  end
end
