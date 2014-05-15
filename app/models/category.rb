class Category < ActiveRecord::Base
	validates_presence_of :name, :parent_id
	has_many :products
end
