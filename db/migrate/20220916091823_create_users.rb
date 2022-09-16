class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Photo
      t.text :Bio
      t.timestamp :UpadtedAt
      t.timestamp :CreatedAt
      t.integer :PostsCounter

      t.timestamps
    end
  end
end
