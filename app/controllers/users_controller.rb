class UsersController < ApplicationController

   def new
      @user = User.new
   end

   def confirm
     @user = User.new
<<<<<<< HEAD
     @user.name = params[:name]
     @user.email = params[:email]
     @user.password = params[:password]
     @user.password_confirmation = params[:password_confirmation]
=======
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
   end
>>>>>>> be84b985b7288d6d3789bc3c64ecc1ceda975aaa

   def create
     @user = User.new
     @user.name = params[:name]
     @user.email = params[:email]
     @user.password = params[:password]
     @user.password_confirmation = params[:password_confirmation]

     if @user.save
       flash[:notice] = "Welcome to Bloccit #{@user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end

<<<<<<< HEAD
=======

>>>>>>> be84b985b7288d6d3789bc3c64ecc1ceda975aaa
end
