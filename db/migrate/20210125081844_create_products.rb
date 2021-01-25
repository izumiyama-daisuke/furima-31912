class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sitem_name,        null: false  
      t.text :description,         null: false
      t.integer :ategory_id,       null: false
      t.integer :state_id,         null: false 
      t.integer :delivery_fee_id,  null: false  
      t.integer :prefecture_id,    null: false 
      t.integer :day_id,           null: false 
      t.integer :price,            null: false 
      t.references :user,          foreign_key: true 

      t.timestamps
    end
  end
end
