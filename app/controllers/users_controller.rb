class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create]

    def create
        user = User.create(user_params)
        puts user
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
        params.permit(:id, :bio, :teams, :favorites)

        if params.key?(:teams)
          params[:teams].map do |team|
            if team[:id] == -1
              #Team.create(user: @user, name: team[:name])
              Team.create(user: @user)
            else
              db_team = Team.find(team[:id])
              #db_team.name = team[:name]
              db_team.pokemon = Pokemon.where(id: team[:pokemon].map { |p| p[:id] })
              db_team.save
            end
          end
        end

        if params.key?(:favorites)
          @user.favorites = Pokemon.where(id: params[:favorites].map { |p| p[:id] })
          @user.save
        end

        if params.key?(:bio)
          @user.update(bio: params[:bio])
        end

        @user = User.find(@user.id)
        render json: @user, status: 200
      end
    
      def destroy
        userId = @user.id
        @user.destroy
        render json: {message:"User account deleted", userId:userId}
      end
    
      def show
        render json: @user, includes: {teams: :pokemon}, status: 200
      end

    private

    def user_params
        params.permit(:username, :password)
    end

 #   def update_user_params
 #     params.permit(:id, :bio, :teams, :favorites)
 #   end

    #def set_user
    #  @user = User.includes(teams: :pokemon).find(params[:id])
    #end

    #def set_user_with_teams
    #  @user = User.includes(teams: :pokemon).find(params[:id])
    #end
end
