#!/usr/bin/env ruby
#
# Sensu Flowdock (https://www.flowdock.com/api/chat) notifier
# This handler sends event information to the Flowdock Push API: Chat.
# The handler pushes event output to chat:

# Input:
# json_config["flowdock"] (i.e. flowdock.json)
#   auth_token : The flowdock api token (flow_api_token) REQUIRED
#   tags       : List of tags to apply to the posted message. Defaults to ['sensu']
#   user_name  : User name used to send event.  Defaults to 'Sensu'
#
# @event['client']
#   flowdock_auth_token : Override the default token on a per-client basis
#   flowdock_tags : Override the tags on a per-client basis
#   flowdock_user : Override the user on a per-client basis
#
# @event['check']
#   flowdock_auth_token : Override the default token on a per-check basis
#   flowdock_tags : Override the tags on a per-check basis
#   flowdock_user : Override the user on a per-check basis
#
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
  def handle
    token = @event['client']['flowdock_auth_token'] || @event['check']['flowdock_auth_token'] || settings['flowdock']['auth_token']
    tags = @event['client']['flowdock_tags'] || @event['check']['flowdock_tags'] || settings['flowdock']['tags'] || %w(sensu)
    user_name = @event['client']['flowdock_user_name'] || @event['check']['flowdock_user_name'] || settings['flowdock']['user_name'] || 'Sensu'

    data = @event['check']['output']

    flow = Flowdock::Flow.new(api_token: token, external_user_name: user_name)
    flow.push_to_chat(content: data, tags: tags)
  end
end
