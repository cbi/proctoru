ProctorU
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

How to use it
---------

```ruby
    response = Proctoru.getScheduleInfoAvailableTimesList({
      :student_id => 1,
      :duration => 120,
      :time_zone_id => "CENTRAL STANDARD TIME",
      :start_date => (Time.now + (60*60*24*7)).utc.iso8601,
      :takeitnow => "F",
      :isadhoc => "T"
    })
```
