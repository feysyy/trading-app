BASE_URL = "https://financialmodelingprep.com/stable/".freeze

module MarketApi
  class FmpPrice
    # display all stocks with prices in index. Didn't include because it took a lot of time to load.
    # def get_stock_prices
    #   Company.pluck(:symbol).each_with_object({}) do |symbol, hash|
    #     response = Faraday.get("#{BASE_URL}quote?symbol=#{symbol}&apikey=#{ENV["APIKEY"]}")
    #     stock = JSON.parse(response.body).first
    #     hash[symbol] = stock["price"]
    #   end
    # end

    def get_stock_price(symbol)
      response = Faraday.get("#{BASE_URL}quote?symbol=#{symbol}&apikey=#{ENV["APIKEY"]}")
      JSON.parse(response.body)
    end
  end
end
