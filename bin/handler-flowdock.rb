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

  def build_tags_list
    json_config = config[:json_config] || 'flowdock'
    default_tags = settings[json_config]['tags'] || 'sensu'
    tags = default_tags.split(' ')
    if settings[json_config].key?('subscriptions')
      @event['check']['subscribers'].each do |sub|
        if settings[json_config]['subscriptions'].key?(sub)
          tags.concat settings[json_config]['subscriptions'][sub]['tags'].split(' ')
        end
      end
    end
    tags
  end

  def handle
    json_config = config[:json_config] || 'flowdock'
    token     = settings[json_config]['auth_token']
    data      = "Host: #{@event['client']['name']} Check: #{@event['check']['name']} - #{@event['check']['output']}"
    tags       = build_tags_list
    name_from = settings[json_config]['name_from'] || 'Sensu'

    push_type = settings[json_config]['push_type'] || 'chat'
    if push_type.eql? 'chat'
      flow   = Flowdock::Flow.new(api_token: token, external_user_name: name_from)
      flow.push_to_chat(content: data, tags: tags)
    elsif push_type.eql? 'inbox'
      mail_from    = settings[json_config]['mail_from'] || 'alerting@sensu.com'
      subject_from = settings[json_config]['subject_from'] || 'Sensu alerting'
      flow = Flowdock::Flow.new(api_token: token, source: name_from, from: { name: name_from, address: mail_from })
      flow.push_to_team_inbox(subject: subject_from, content: data, tags: tags)
    end
  end
end
