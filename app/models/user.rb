class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :role_id, presence: true
end
