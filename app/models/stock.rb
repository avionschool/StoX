class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :brokers, class_name: "User", through: :user_stocks, source: :user

  # has_many :buyer_stocks
  # has_many :users, through: :buyer_stocks

  has_many :transactions
  has_many :buyers, class_name: "User", through: :transactions

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:api_key],
                                  secret_token: Rails.application.credentials.iex_client[:secret_token],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      quote = client.quote(ticker_symbol)
      quote.latest_price
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, latest_price: quote.latest_price)
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end
