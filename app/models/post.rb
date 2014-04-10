class Post < ActiveRecord::Base
		has_many :comments, dependent: :destroy
	
	has_many :comments

	def init
		update_attribute(:like,0)
	end
	def addLike
		update_attribute(:like,like+1)
	end

	def dislike 
		if like ==0
			like =0
		else 
		 decrement!(:like, 1)
		  end	
	end	 

	def self.search(texto)
    	where("content like ?", "%#{texto}%") 
  	end
  	def self.searchCategory(texto)
  		where("content like ?", "%#{texto}%")
  	end	
end
