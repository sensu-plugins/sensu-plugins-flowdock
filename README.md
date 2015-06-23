## Sensu-Plugins-flowdock

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-flowdock.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-flowdock)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-flowdock.svg)](http://badge.fury.io/rb/sensu-plugins-flowdock)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-flowdock.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-flowdock)
"!https://codeship.com/projects/69409d80-ea31-0132-13b2-32dfa18a9fce/status?branch=master!":https://codeship.com/projects/83073
[ ![Codeship Status for sensu-plugins/sensu-plugins-flowdock](https://codeship.com/projects/69409d80-ea31-0132-13b2-32dfa18a9fce/status?branch=master)](https://codeship.com/projects/83073)

## Functionality

## Files
 * bin/handler-flowdock.rb

## Usage
flowdock.json
```
{
  "flowdock": {
    "auth_token": "FLOWDOCK_API_TOKEN",
    "tags" : ["sensu", "my-team"], // Optional, deafults to ['sensu']
    "user_name" : "Status" // Optional, defaults to 'Sensu'
  }
}
```

auth_token is the only required parameter.

Optionally include an auth token, list of tags, or user name in the client
or check to override the global config.


## Installation

[Installation and Setup](https://github.com/sensu-plugins/documentation/blob/master/user_docs/installation_instructions.md)

## Notes
