class CreatePageInsights < ActiveRecord::Migration[5.2]
  def change
    create_table :page_insights do |t|
      t.string :url

      t.integer :max_ttfb
      t.integer :max_tti
      t.integer :max_speed_index
      t.integer :max_ttfp

      t.integer :ttfb
      t.integer :tti
      t.integer :speed_index
      t.integer :ttfp

      t.boolean :passed

      t.timestamps
    end
  end
end
