# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_106_194_615) do
  create_table 'entries', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'room_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_entries_on_room_id'
    t.index ['user_id'], name: 'index_entries_on_user_id'
  end

  create_table 'messages', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'room_id', null: false
    t.text 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_messages_on_room_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'relationships', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'follower_id', null: false
    t.integer 'followed_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'rooms', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'teamname', null: false
    t.integer 'toprank_id', null: false
    t.integer 'jgrank_id', null: false
    t.integer 'midrank_id', null: false
    t.integer 'suprank_id', null: false
    t.integer 'botrank_id', null: false
    t.integer 'power_id', null: false
    t.text 'detail', null: false
    t.integer 'weekday_id', null: false
    t.integer 'stime_id', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'entries', 'rooms'
  add_foreign_key 'entries', 'users'
  add_foreign_key 'messages', 'rooms'
  add_foreign_key 'messages', 'users'
end
