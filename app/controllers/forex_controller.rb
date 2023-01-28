class ForexController < ApplicationController
  def symbols
    # require "open-uri"
    # require "json"
    symbols_endpoint = "https://api.exchangerate.host/symbols"
    @symbols = JSON.parse(URI.open(symbols_endpoint).read).fetch("symbols").keys

    render({ :template => "/exchange_rates/currencies.html.erb" })
  end

  def exchange
    @original_currency = params.fetch("original_currency")
    symbols_endpoint = "https://api.exchangerate.host/symbols"
    @symbols = JSON.parse(URI.open(symbols_endpoint).read).fetch("symbols").keys

    render({ :template => "/exchange_rates/currency_exchanges.html.erb" })
  end

  def conversion
    @original_currency = params.fetch("original_currency")
    @new_currency = params.fetch("new_currency")
    exchange_rate_endpoint = "https://api.exchangerate.host/convert?from=" + @original_currency + "&to=" + @new_currency
    @exchange_rate_data = JSON.parse(URI.open(exchange_rate_endpoint).read)
    @rate = @exchange_rate_data.fetch("result")

    render({ :template => "/exchange_rates/conversion.html.erb" })
  end
end
