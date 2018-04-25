class Deal < ApplicationRecord

 has_many :companies, dependent: :destroy

end
