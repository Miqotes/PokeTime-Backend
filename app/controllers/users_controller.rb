class UsersController < ApplicationController
    # skip_before_action :require_login, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            payload = { user_id: user.id }
            token = encode_token(payload)
            render json: { user: user, jwt: token }
        else
            render json: { errors: user.errors.full_messages }, status: :not_acceptable
        end
    end

    def index
        users = User.all
        render json: users, status: 200
      end
    
      def update
        @user.update(user_params)
        render json: @user, status: 200
      end
    
      def destroy
        userId = @user.id
        @user.destroy
        render json: {message:"User account deleted", userId:userId}
      end
    
      def show
        render json: @user, status: 200
      end

    private

    def user_params
        params.permit(:username, :password)
    end

    def set_user
        @user = User.find(params[:id])
      end
end
