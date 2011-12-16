# A Client for the TopSpin Store API V2

[Topspin](http://www.topspinmedia.com/) is an ecommerce platform for musicians. It provides an [API](http://support.topspinmedia.com/entries/20294118-store-api-v2) that this gem uses. This gem doesn't do anything spectacular, it just makes it easy to connect your Ruby app to the API.

It was developed by [Bandzoogle](http://bandzoogle.com/), the most powerful band website platform. Bandzoogle integrates nicely with Topspin.

## Installation

If you're using [bundler](http://gembundler.com/):

```
source "http://rubygems.org"
gem 'topspin_store'
```

## Usage

```ruby
> store = TopspinStoreApi::Store.new 1234
 => #<TopspinStoreApi::Store:0x007fbc3a052b40...
> store.authenticate 'me@example.com', 'MYAPIKEY123456'
```

In the above example, <code>1234</code> refers to your artist_id.

### TopspinStoreApi::Store#offers

Gets a list of offers available from the store:

```ruby
> offers = store.offers
 => [{"id"=>59484, "price"=>"$100.00", "currency"=>"USD", ...
```

The array is paginated by the API - you can fetch other pages using the <code>:page</code> option

```ruby
> offers = store.offers :page => 2
```

The array has been extended to include information about the pagination. For instance, if there were 30 offers:

```ruby
> offers.total_pages
 => 2
> offers.current_page
 => 1
> offers.total_entries
 => 30
> offers.per_page
 => 25
```

### TopspinStoreApi::Store#detail

Gets detailed information about one offer:

```ruby
> store.detail(59484)
 => {"id"=>59484, "price"=>"$100.00", "currency"=>"USD", ...
```

### Errors

These are the errors you might expect:

* <code>TopspinStoreApi::ClientError</code> - either your credentials are wrong or you've asked for a resource that doesn't exist.
* <code>TopspinStoreApi::InternalError</code> - an unexpected problem with the API.
* <code>Timeout::Error</code> - the API has taken longer than 3 seconds to respond.

## Topspin API

See the [API](http://support.topspinmedia.com/entries/20294118-store-api-v2) for more information.
