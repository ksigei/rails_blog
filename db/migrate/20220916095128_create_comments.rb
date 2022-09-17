class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: { to_table: :posts }
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.text :text


      t.timestamps
    end
  end
end
