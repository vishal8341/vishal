class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    def show
    end

    def index
        @page = Page.all
    end

    def edit
    end
    def new
        @page = Page.new
    end
    def create
        @page = Page.new(pages_params)
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
end