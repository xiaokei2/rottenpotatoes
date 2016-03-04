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
  def self.movies(sort_field)
    self.order(sort_field)
  end
end
