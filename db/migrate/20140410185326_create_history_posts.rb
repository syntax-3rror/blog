class CreateHistoryPosts < ActiveRecord::Migration
  def change
    create_table :history_posts do |t|
      t.string :belongs_to
     

      t.timestamps
    end
  end
end
