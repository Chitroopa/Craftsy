class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :comment, :string
      t.column :rating, :int
      t.column :product_id, :int
      t.column :user_id, :int

      t.timestamps
    end
  end
end
