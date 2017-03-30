class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :url
      t.integer :time
      t.string :name
      t.string :message
      t.integer :health_code
      t.integer :notification_id

      t.timestamps
    end
  end
end
