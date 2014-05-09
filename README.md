ProcturU
=========

A client library for the ProcturU API

Install
-------

Include the gem in your Gemfile:

```ruby
gem 'proctoru'
```

Bundle:

    bundle install

Configure
---------

```ruby
Proctoru.configure do |config|
  config.api_key = 'Your ProctorU API key'
  config.api_url = 'https://apitest.proctoru.com/'
end
```
