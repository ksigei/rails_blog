class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :post, index: true, foreign_key: { to_table: :posts }
      t.boolean :like
      
      t.timestamps
    end
  end
end