json.extract! report, :id, :code, :body, :url_id, :created_at, :updated_at
json.url report_url(report, format: :json)
