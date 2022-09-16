class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :AuthorId
      t.text :Text
      t.timestamp :UpadtedAt
      t.timestamp :CreatedAt

      t.timestamps
    end
  end
end
