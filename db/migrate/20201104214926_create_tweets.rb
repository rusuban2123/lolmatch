class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text       :detail,            null: false
      t.references :user,              null: false, foreign_key: true
      t.integer    :weekday_id,        null: false
      t.time       :starttime,         null: false
      t.time       :endtime,           null: false
      t.timestamps
    end
  end
end
