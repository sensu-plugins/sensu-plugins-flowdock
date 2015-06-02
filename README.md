## Sensu-Plugins-flowdock

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-flowdock.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-flowdock)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-flowdock.svg)](http://badge.fury.io/rb/sensu-plugins-flowdock)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-flowdock)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-flowdock.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-flowdock)
"!https://codeship.com/projects/69409d80-ea31-0132-13b2-32dfa18a9fce/status?branch=master!":https://codeship.com/projects/83073

## Functionality

## Files
 * bin/handler-flowdock

## Usage

```
{
  "flowdock": {
    "auth_token": "FLOWDOCK_API_TOKEN"
  }
}
```

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-flowdock -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-flowdock`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-flowdock' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-flowdock' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
