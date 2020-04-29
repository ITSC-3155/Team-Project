class ForumController < ApplicationController
    def index
        @forum = Forum.all
    end
    
    def show
        @forum = Forum.find(params[:id])
    end
    
    def forum
    end
    
    def create
    @forum = Forum.new(params[:forum])
    
    @forum.save
    redirect_to @forum
    end
end

private
    def forum_params
        params.require(:forum).permit(:title, :text)
    end