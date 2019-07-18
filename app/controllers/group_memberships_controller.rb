class GroupMembershipsController < ApplicationController
    before_action :logged_in_user

    def create
        group = Group.find(params[:group_id])
        current_user.subscribe(group)
        redirect_to group
    end

    def destroy
        group_id = GroupMembership.find(params[:id]).group_id
        group = Group.find_by(id: group_id)
        current_user.unsubscribe(group)
        redirect_to group
    end
end
