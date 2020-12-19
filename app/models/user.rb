class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
                    #   uniqueness: true
    
    belongs_to :role
end
