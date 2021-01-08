class UsersController < ApplicationController

      before_action :authenticate_user!
    
      def index
        @users = User.all
      end
    
      def show
        @user = User.find(params[:id])
      end
    
      def create
        @user = User.new(user_params)
        @user.save 
        
        redirect_to home_path                #routes are not yet defined
      end
    
      def update
        @user = User.find(params[:id])
        @user.update(user_params)
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to home_path           #routes are not yet defined
      end

      def my_portfolio
        @tracked_stocks = current_user.stocks
      end

      private 

      def user_params
        params.require(:user).permit(:name, :role)
      end

end
