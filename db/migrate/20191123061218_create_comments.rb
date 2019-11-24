class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :blog_post
      t.string :message
      t.timestamps
    end
  end
end
