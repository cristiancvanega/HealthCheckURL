class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :slack_channel
      t.string :slack_webhook
      t.string :slack_username

      t.timestamps
    end
  end
end
