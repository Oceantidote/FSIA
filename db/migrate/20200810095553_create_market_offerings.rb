class CreateMarketOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :market_offerings do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
