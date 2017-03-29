json.extract! notification, :id, :name, :slack_channel, :slack_webhook, :slack_username, :created_at, :updated_at
json.url notification_url(notification, format: :json)
