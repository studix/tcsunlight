class UsersController < ApplicationController
  before_filter :authorize, only: [:update, :edit]

	def new
    @user = User.new
  end

 # POST to update the password
 def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
       redirect_to root_url, :notice => "Password successfully changed."
    else  
      render "edit"  
    end  
  end  

  # Get to update the password
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end
  end  

  # POST
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end
