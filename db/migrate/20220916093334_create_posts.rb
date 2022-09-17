class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.integer :title
      t.text :text

      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps 
    end
  end
end
