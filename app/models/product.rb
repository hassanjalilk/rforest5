class Product < ActiveRecord::Base
	has_many :reviews
	has_many :users, :through => :reviews

	validates :description, :name, :presence => true
	validates :price, :numericality => [:only_integer => :true]
end
