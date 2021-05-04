class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user
        else
            flash.now[:alert] = "Their was something wrong with your login credential"
            render 'new'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end