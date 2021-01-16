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
  validates :approved, presence: true
                      
  belongs_to :role

  before_create :set_status
  after_create :welcome_email


  def set_status
    if self.role_id == 2
      self.approved = false
    else 
      self.approved = true
    end
  end

  def welcome_email
    if self.role_id == 1
      UserMailer.welcome_email(self).deliver
    elsif self.role_id == 2
      UserMailer.pending_email(self).deliver
    end
  end

  def approve_application
    self.toggle(:approved).save
  end
  


  def stock_tracked(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

end
