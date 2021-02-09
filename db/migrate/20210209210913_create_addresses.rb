class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,      null: false
      t.integer :prefecture_id,    null: false                    #都道府県(ActiveHash)
      t.string  :city,             null: false                    #市町村
      t.string  :address1,         null: false                    #番地
      t.string  :address2,         null: false                    #建物名
      t.string  :telephone,        null: false                    #電話番号
      t.references :order,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
