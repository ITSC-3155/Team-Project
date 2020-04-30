class CommentsController < ApplicationController
    def create
        @forum = Forum.find(params[:forum_id])
        @comment = @forum.comments.create(comment_params)
        redirect_to forum_path(@forum)
    end
    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
