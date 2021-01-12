class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :buyer_stocks
  has_many :stocks, through: :buyer_stocks

  has_many :transactions
  has_many :stocks, through: :transactions
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
                      
  belongs_to :role

  def stock_tracked(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

end
