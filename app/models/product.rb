class Product < ActiveRecord::Base
	validates_presence_of :name, :price, :category_id, :description
	validates_uniqueness_of :catalog_number
	belongs_to :category
end
