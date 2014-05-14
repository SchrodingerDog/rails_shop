class Product < ActiveRecord::Base
	validates :name, :price, :description, :catalog_number, presence: true
	validates :catalog_number, uniqueness: true
end
