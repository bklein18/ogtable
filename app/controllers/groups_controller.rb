class GroupsController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

    def index
        @groups = Group.all.paginate(page: params[:page])
    end

    def show
        @group = Group.find(params[:id])
        @users = @group.users.paginate(page: params[:page])
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            flash[:success] = "Group \"#{@group.name}\" successfully created."
            redirect_to @group
        else
            render 'new'
        end
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])
        if @group.update_attributes(group_params)
            flash[:success] = "Group information updated."
            redirect_to @group
        else
            render 'edit'
        end
    end

    def destroy
        Group.find(params[:id]).destroy
        flash[:success] = "Group deleted."
        redirect_to groups_url
    end

    def users
        @title = "Users"
        @group = Group.find(params[:id])
        @users = @group.users.paginate(page: params[:page])
        render 'show_users'
    end

    private

        def group_params
            params.require(:group).permit(:name, :description)
        end

end
