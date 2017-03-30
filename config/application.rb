require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Newapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.after_initialize do

	    scheduler = Rufus::Scheduler.new
		scheduler.every '5s' do

			urls = Url.all
	    	urls.each do |uri|
	    		puts uri.notification.slack_webhook
	    		puts uri.notification.slack_username
	    		puts uri.notification.slack_channel
	    		puts uri.message
	    		puts uri.health_code
		  		url = URI.parse(uri.url)
				req = Net::HTTP::Get.new(url.to_s)
				res = Net::HTTP.start(url.host, url.port) {|http|http.request(req)}
				puts ''
				puts res.code
				puts res.body
				if res.code != "#{uri.health_code}" then
					notifier = Slack::Notifier.new uri.notification.slack_webhook,channel: "##{uri.notification.slack_channel}" ,username: "#{uri.notification.slack_username}"
					notifier.ping "#{uri.name} #{uri.message}"
					report = Report.create(url_id: uri.id, code: res.code, body: res.body)
				end
	    	end
			
	  	end

	end
	
  end
end
