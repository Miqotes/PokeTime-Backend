class TeamsController < ApplicationController
    def destroy
        teamId = params[:id]
        team = Team.find(teamId)
        team.destroy
        render json: {message:"Tean deleted", teamId: teamId}
    end
end
