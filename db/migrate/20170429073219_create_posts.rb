class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title
      t.text :content
      t.string :edit_user_name
      t.string :edit_user_email
      t.timestamps null: false
    end
  end
end
