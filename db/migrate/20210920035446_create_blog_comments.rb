class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.references :blog, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
