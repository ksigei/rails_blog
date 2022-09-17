class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Author
      t.integer :Title
      t.text :Text
      t.timestamp :UpadtedAt
      t.timestamp :CreatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
