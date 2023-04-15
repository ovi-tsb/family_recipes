# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_415_204_453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'directions', force: :cascade do |t|
    t.text 'step'
    t.bigint 'recipe_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_directions_on_recipe_id'
  end

  create_table 'friendconnects', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'friend_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'confirmed', default: false
  end

  create_table 'friendships', id: :serial, force: :cascade do |t|
    t.string 'friendable_type'
    t.integer 'friendable_id'
    t.integer 'friend_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'blocker_id'
    t.integer 'status'
    t.index %w[friendable_id friend_id], name: 'index_friendships_on_friendable_id_and_friend_id', unique: true
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name'
    t.bigint 'recipe_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['recipe_id'], name: 'index_ingredients_on_recipe_id'
  end

  create_table 'invitations', force: :cascade do |t|
    t.bigint 'user_id'
    t.integer 'friend_id'
    t.boolean 'confirmed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0
    t.integer 'group_id'
    t.index ['user_id'], name: 'index_invitations_on_user_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'directions', 'recipes'
  add_foreign_key 'ingredients', 'recipes'
  add_foreign_key 'invitations', 'users'
end
