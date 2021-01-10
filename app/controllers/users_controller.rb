class UsersController < ApplicationController

      before_action :authenticate_user!
    
      # before_action :authenticate_user!, :is_admin?

      def show
        
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(params[:user])
        if @user.save
          UserMailer.welcome_email(@user).deliver_now
          flash[:success] = "Object successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
      end
      
      
      
end
