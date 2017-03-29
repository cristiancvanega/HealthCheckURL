class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :code
      t.string :body
      t.integer :url_id

      t.timestamps
    end
  end
end
