class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :text
      t.integer :like

      t.timestamps
    end
  end
end
