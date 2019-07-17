class GamesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def create
        @game = current_user.games.build(game_params)
        if @game.save
            flash[:success] = "Game added!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end

    def destroy
        @game.destroy
        flash[:success] = "Game deleted"
        redirect_to request.referrer || root_url    
    end

    private
        
        def game_params
            params.require(:game).permit(:name, :description)
        end

        def correct_user
            @game = current_user.games.find_by(id: params[:id])
            redirect_to root_url if @game.nil?
        end
end
