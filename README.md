[![Build Status](https://travis-ci.org/tomraithel/tick_tack.svg?branch=master)](https://travis-ci.org/tomraithel/tick_tack)
[![Gem Version](https://badge.fury.io/rb/tick_tack.svg)](https://badge.fury.io/rb/tick_tack)

# TickTack

**TickTack** is a lean wrapper for Rubys native `Date` object to provide some
helpful methods for easy calendar creation. See the [Example](#example) section below for
a better unterstanding! 



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tick_tack'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tick_tack





## Usage


### Calendar

Create a new calendar object

```ruby
calendar = TickTack::Calendar.new
```

To overwrite the current date just pass in another date. 
This date is used as a fallback for the factory methods. 
For example - if you call `calendar.month(2014)` without a month, 
it will return the current month but in year 2014. 

```ruby
TickTack::Calendar.new(Date.new(2015, 5, 27))
```

#### Methods

- `calendar.now` Returns the calendars base `Date`
- `calendar.year(2013)` Returns the `Year` for the given year number
- `calendar.month(2013, 1)` Returns the `Month` for the given year and month
- `calendar.day(2013, 1, 12)` Returns the `Day` for the given year, month and day




### Year

To get a year from the calendar call the `year` on the calendar object

```ruby
year = calendar.year(2014)
```

#### Methods

- `year.first_day` Get the first day of the year 
- `year.last_day` Get the last day of the year 
- `year.month(2)` Get the `Month` february in this year 
- `year.months` Get all months as an array for this year 
- `year.contains?(other)` Check if other is part of this year. `other` can be either a `Month` or a `Day`  
- `year.next` Get the next `Year`  
- `year.previous` Get the previous `Year`  




### Month

To get a month, you can either call the creator method on the calendar or on the `Year`:

```ruby
month = calendar.month(2014, 5)
# or
month = year.month(5)
```

#### Methods

- `month.first_day` Get the first day of the month 
- `month.last_day` Get the last day of the month 
- `month.day(2)` Get the requested `Day` on this month 
- `month.weekdays` Gets an array of all weeks from this month containing all days. 
Including overlapping days in other months. This is useful for rendering a month-view
of an calendar.
- `month.contains?(day)` Check if a `Day` is part of this month
- `month.next` Get the next `Month`
- `month.previous` Get the previous `Month`






### Day

A day can be created from a calendar or month:

```ruby
day = calendar.day(2014, 5, 30)
# or
day = month.day(30)
```

#### Methods
- `day.week_start` Returns the first `Day` of the week which the current day is in. 
To configure the first day of the week, see [Localization](#localization) section below.
- `day.week_end` Returns the last `Day` of the week which the current day is in.
- `day.weekdays` Returns an array of `Day`s for the week in which the current day is in.
- `day.next` Returns the next `Day`
- `day.previous` Returns the previous `Day`






### Localization

Currently only dow (day of week) value can be overwritten which usually starts with 0. To set the day to monday, just pass in the locale config as second argument:

```ruby
calendar = TickTack::Calendar.new(nil, {dow: 1})
```



## Example

TODO... maybe tomorrow :)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomraithel/tick_tack.




## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

