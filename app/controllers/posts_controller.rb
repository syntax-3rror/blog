class PostsController < ApplicationController

def index
		 if params[:search]
	     	@posts = Post.search(params[:search]).reorder("created_at DESC")
	    else
			@posts = Post.reorder("created_at DESC")
		end
	end

	def reporte
		@posts = Post.reorder("created_at DESC")
		
	end

	def administrador
		@posts = Post.reorder("created_at DESC")
	end

	def back_to_index
		redirect_to "/"
	end	

	def like
		@post = Post.find(params[:id])
		@post.addLike
		redirect_to posts_path
	end

	def delete
			@post = Post.find(params[:id])
	 		@post.destroy
	 		redirect_to '/' 
	end

	def create
		  @post = Post.new(post_params)
		  @post.init
		  if @post.save
		    redirect_to '/' , notice: 'The post has been sucessfully created  '
		  else
		  	flash[:notice] = "No se pudo guardar el post"
		    render 'new'
		  end
	end

	def show
		@post = Post.find(params[:id])
		
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

	  	if @post.update(params[:post].permit(:title, :content))
	    	redirect_to '/', notice: 'The post has been  sucessfully updated'
	  	else
	  		flash[:notice] = "No se pudo actualizar el post"
	    	render 'edit'
	  	end
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :content)
	  end
end
