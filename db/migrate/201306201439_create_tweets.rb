class CreateTweets < ActiveRecord::Migration
  def up
    create_table :tweets do |t|
      t.integer :twitter_id
      t.string :text
      t.integer :congress_member_id
    end
  end

  def down
    drop_table :tweets
  end
end




















