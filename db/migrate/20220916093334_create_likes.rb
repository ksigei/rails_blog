class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :AuthorId
      t.integer :PostId
      t.timestamp :UpadtedAt
      t.timestamp :CreatedAt

      t.timestamps
    end
  end
end
