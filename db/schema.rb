ActiveRecord::Schema.define(version: 20180929001326) do

  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
