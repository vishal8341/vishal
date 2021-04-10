class PagesController < ApplicationController
    def show
    end

    def index
        @page = Page.all
    end

    def edit
        @page = Page.find(params[:id])
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
        @page = Page.find(params[:id])
        if @page.update(pages_params)
            flash[:notice] = "Page updated successfully "
            redirect_to pages_path
        else
            render 'edit'
        end
    end
    def show
        @page = Page.find(params[:id])
    end
    def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end
    private
    def pages_params
        params.require(:page).permit(:title, :description)
    end
end