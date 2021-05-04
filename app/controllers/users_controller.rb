class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def new
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the Blog #{@user.username}, you have successully signed up"
            redirect_to pages_path
        else
            render 'new'
        end
    end
    
    def show
        @page = @user.pages.paginate(page: params[:page], per_page: 4)
    end

    def destroy
        @user.pages.ids.each do |id|
            Page.delete(id)
        end
        @user.delete
        session[:user_id] = nil if @user == current_user
        flash[:alert] = "Account and all associated articles successfully deleted"
        redirect_to pages_path
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "Your not authorized to edit or delete users"
            redirect_to users_path
        end
    end

    
end
