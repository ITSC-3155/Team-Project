class ForumsController < ApplicationController
    def index
        @forums = Forum.all
    end
    
    def show
        @forum = Forum.find(params[:id])
    end
    
    def new
        @forum = Forum.new
    end
    
    def forum
    end
    
    def update
        @forum = Forum.find(params[:id])
        
        if @forum.update(forum_params)
            redirect_to @forum
        else
            render 'edit'
        end
    end
    
    def edit
        @forum = Forum.find(params[:id])
    end
    
    def create
        @forum = Forum.new(forum_params)
    
        if @forum.save
            redirect_to @forum
        else
            render 'new'
        end
    end
end

private
    def forum_params
        params.require(:forum).permit(:title, :text)
    end

