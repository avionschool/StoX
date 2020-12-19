class UsersController < ApplicationController
    
      def index
        @users = User.scoped
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
        @user.update(params)
      end
    
      def edit
        @user = User.find(params[:id])
      end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to home_path           #routes are not yet defined
      end

      private 

      def user_params
        params.require(:user).permit(:name, :role)
      end
end
