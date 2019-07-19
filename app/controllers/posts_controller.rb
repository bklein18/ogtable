class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        else
            render 'groups/show', :locals => {:group => Group.find(post_params["group_id"])}
        end
    end

    def destroy
    end

    private

        def post_params
            params.require(:post).permit(:content)
        end

end
