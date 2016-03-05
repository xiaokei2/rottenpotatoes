class Movie < ActiveRecord::Base
	  #attr_accessible :title,:rating,:description,:release_date
	  ## ...
	    def create
	      @user = User.new(user_params) ## Invoke user_params method
	      if @user.save
	        redirect_to @user, notice: 'User was successfully created.' 
	      else
	        render action: 'new'
	      end       
	    end
	    ## ... 

	    private
	    ## Strong Parameters 
	    def user_params
	      params.require(:user).permit(:title,:rating,:description,:release_date)
	    end 
	
	def self.movies(filters, sort_field)
		return self.order(sort_field) if not filters
		self.where({:rating => filters}).order(sort_field)
	end
	def self.ratings
    	self.pluck(:rating).uniq
  	end
  	def self.set_options(params,session)
  		setup = {}
  		setup[:ratings] = if params[:ratings]
  		  if params[:ratings].kind_of? Hash
  		  	params[:ratings].keys
  		  else
  		  	params[ratings]
  		  end
  		


  		elsif session[:ratings]
  		  session[:ratings]
  		  
  		else
  		  self.ratings
  		end

  		setup[:order_by] = if params[:order_by]
  		  params[:order_by]
  		elsif session[:order_by]
  		  session[:order_by]
  		  
  		else
  		  nil
  		end

  		setup
  	end
end
