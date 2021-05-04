class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy] 
    def show
    end

    def index
        @page = Page.paginate(page: params[:page], per_page: 5)

    end

    def edit
    end
    def new
        @page = Page.new
    end
    def create
        @page = Page.new(pages_params)
        @page.user = current_user
        if @page.save
            redirect_to pages_path
            flash[:notice] = "Page successfully saved..."
        else
            render 'new'
        end
    end
    def update
        if @page.update(pages_params)
            flash[:notice] = "Page updated successfully "
            redirect_to pages_path
        else
            render 'edit'
        end
    end
    def show
    end
    def destroy
        @page.destroy
        redirect_to pages_path
    end
    private

    def pages_params
        params.require(:page).permit(:title, :description)
    end

    def set_page
        @page = Page.find(params[:id])
    end

    def require_same_user
        if current_user != @page.user && !current_user.admin
            flash[:alert] = "Your not authorize to edit or delete articles"
            redirect_to pages_path
        end
    end
end