class Product < ActiveRecord::Base
	validates :name, :price, :description, :cat_number, presence: true
end
