class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence:true, length:{ minimum: 2 }
    has_many :students, dependent: :destroy
end
