#!/usr/bin/env ruby
#
# Sensu Flowdock (https://www.flowdock.com/api/chat) notifier
# This handler sends event information to the Flowdock Push API: Chat.
# The handler pushes event output to chat:
# This setting is required in flowdock.json
#   auth_token  :  The flowdock api token (flow_api_token)
#
# Dependencies
# -----------
# - flowdock
#
#
# Author Ramez Hanna <rhanna@informatiq.org>

# Released under the same terms as Sensu (the MIT license); see LICENSE
# for details

require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-handler'
require 'flowdock'

class FlowdockNotifier < Sensu::Handler
  option :json_config,
         description: 'Config Name',
         short: '-j JsonConfig',
         long: '--json_config JsonConfig',
         required: false

  def build_tag_list
    json_config = config[:json_config] || 'flowdock'
    default_tag = settings[json_config]['tag'] || "sensu"
    tag = default_tag.split(" ")
    if settings[json_config].key?('subscriptions')
      @event['check']['subscribers'].each do |sub|
        if settings[json_config]['subscriptions'].key?(sub)
          tag.concat settings[json_config]['subscriptions'][sub]['tag'].split(" ")
        end
      end
    end
    tag
  end

  def handle
    json_config = config[:json_config] || 'flowdock'
    token  = settings[json_config]['auth_token']
    data   = "Host: #{@event['client']['name']} Check: #{@event['check']['name']} - #{@event['check']['output']}"
    tag    = build_tag_list
    flow   = Flowdock::Flow.new(api_token: token, external_user_name: 'Sensu')
    flow.push_to_chat(content: data, tags: tag)

  end
end
