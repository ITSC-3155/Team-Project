class ForumsController < ApplicationController
    def index
        @forums = Forum.all
    end
    
    def show
        @forum = Forum.find(params[:id])
    end
    
    def forum
    end
    
    def create
    @forum = Forum.new(forum_params)
    
    @forum.save
    redirect_to @forum
    end
end

private
    def forum_params
        params.require(:forum).permit(:title, :text)
    end

