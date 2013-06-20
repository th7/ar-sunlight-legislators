class ModifyCongressMembers < ActiveRecord::Migration

  def up
    add_column :congress_members, :type, :string

    remove_column :congress_members, :middlename
    remove_column :congress_members, :name_suffix
    remove_column :congress_members, :nickname
    remove_column :congress_members, :district
    remove_column :congress_members, :congress_office
    remove_column :congress_members, :bioguide_id
    remove_column :congress_members, :votesmart_id
    remove_column :congress_members, :fec_id
    remove_column :congress_members, :govtrack_id
    remove_column :congress_members, :crp_id
    remove_column :congress_members, :congresspedia_url
    remove_column :congress_members, :youtube_url
    remove_column :congress_members, :facebook_id
    remove_column :congress_members, :official_rss
    remove_column :congress_members, :senate_class
  end

  def down
    change_table :congress_members do |t|
      t.string :middlename
      t.string :name_suffix
      t.string :nickname
      t.string :district
      t.string :congress_office
      t.string :bioguide_id
      t.string :votesmart_id
      t.string :fec_id
      t.string :govtrack_id
      t.string :crp_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
    end
  end

end
