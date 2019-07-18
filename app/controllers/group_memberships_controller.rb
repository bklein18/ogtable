class GroupMembershipsController < ApplicationController
    before_action :logged_in_user

    def create
        group = Group.find(params[:group_id])
        current_user.subscribe(group)
        respond_to do |format|
            format.html { redirect_to @group }
            format.js
        end
    end

    def destroy
        group = GroupMembership.find(params[:id]).groups
        current_user.unsubscribe(group)
        respond_to do |format|
            format.html { redirect_to @group }
            format.js
        end
    end
end
