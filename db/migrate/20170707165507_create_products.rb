class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :product_name, :string
      t.column :description, :string
      t.column :details, :string
      t.column :cost, :decimal, :precision => 15, :scale => 2
      t.column :artist_name, :string
      t.column :region, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
