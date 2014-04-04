class CommentsController < ApplicationController
	def create
		    @post = Post.find(params[:post_id])
		   	@comment= @post.comments.create(params[:comment].permit(:user,:content))
		    redirect_to '/'
	  	end
end
