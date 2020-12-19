FactoryBot.define do
  
    factory :user do
        name {"Joe"}
        email {"joe@gmail.com"}
        role 
    end

    factory :role do
        name {"broker"}
        description {"gets stocks"}
    end

end