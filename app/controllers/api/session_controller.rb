class Api::SessionController < ApplicationController
    def destroy
        @user = current_user
        if @user
            logout!
            render json: {}
        else
            render json: ['something went wrong'], status: 404
        end
    end
end
